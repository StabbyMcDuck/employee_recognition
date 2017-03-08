require 'rails_helper'

RSpec.describe "users/show", type: :view do
	
  before(:each) do
    @user = assign(:user, FactoryGirl.create(:user))
    current_user = FactoryGirl.create(:user)
    view.define_singleton_method(:current_user) { current_user }
  end

  it "renders attributes in <p>" do
    render
  end
end
