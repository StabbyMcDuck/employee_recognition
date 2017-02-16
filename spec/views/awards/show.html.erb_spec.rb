require 'rails_helper'

RSpec.describe "awards/show", type: :view do
  before(:each) do
    @award = assign(:award, FactoryGirl.create(:user_award))
  end

  it "renders attributes in <p>" do
    render
  end
end
