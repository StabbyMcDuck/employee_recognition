require 'rails_helper'

RSpec.describe "awards/new", type: :view do
 
  current_user = FactoryGirl.create(:user)
 
  before(:each) do
    assign(:award, Award.new())
  end

  it "renders new award form" do
    render
    assert_select "form[action=?][method=?]", awards_path, "post" do
    end
  end
end
