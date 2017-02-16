require 'rails_helper'

RSpec.describe Award, type: :model do
  context 'database' do
    context 'columns' do
      it { is_expected.to have_db_column(:award_type).of_type(:string).with_options(null: false) }
      it { is_expected.to have_db_column(:employee_email).of_type(:string).with_options(null: false) }
      it { is_expected.to have_db_column(:employee_name).of_type(:string).with_options(null: false) }
      it { is_expected.to have_db_column(:granter_id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:employee_id).of_type(:integer).with_options(null: true) }
    end

    context 'indices' do
      it { is_expected.to have_db_index(:granter_id).unique(false) }
      it { is_expected.to have_db_index(:employee_id).unique(false) }
    end
  end

  context 'factories' do

  end
end
