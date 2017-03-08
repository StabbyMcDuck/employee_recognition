require 'rails_helper'

RSpec.describe "awards/show", type: :view do
	
  before(:each) do
    @award = assign(:award, FactoryGirl.create(:user_award))
    current_user = FactoryGirl.create(:user)
    view.define_singleton_method(:current_user) { current_user }
  end

  it "renders attributes in <p>" do
    render
  end
end