# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'database' do
    context 'columns' do
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:crypted_password).of_type(:string).with_options(null: false) }
      it { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
      it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
      it { is_expected.to have_db_column(:password_salt).of_type(:string).with_options(null: false) }
      it { is_expected.to have_db_column(:perishable_token).of_type(:string).with_options(null: true) }
      it { is_expected.to have_db_column(:persistence_token).of_type(:string).with_options(null: true) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end
  end

  context 'factories' do
    context 'user' do
      subject(:user) do
        FactoryGirl.build(:user)
      end

      it { is_expected.to be_valid }

      it 'can be saved' do
        expect {
          user.save!
        }.not_to raise_error
      end
    end
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:crypted_password) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:password_salt) }
  end
end
