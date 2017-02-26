require 'rails_helper'

RSpec.describe "awards/new", type: :view do
 
  before(:each) do
    assign(:award, Award.new())
  end

      current_user = FactoryGirl.create(:user)
    view.define_singleton_method(:current_user) { current_user }

  it "renders new award form" do
    render
    assert_select "form[action=?][method=?]", awards_path, "post" do
    end
  end
end
