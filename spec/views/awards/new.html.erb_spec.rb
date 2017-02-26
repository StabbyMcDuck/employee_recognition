require 'rails_helper'

RSpec.describe "awards/new", type: :view do
  before(:each) do
  	view.stub(:current_user) { User.new # return a user }
    assign(:award, Award.new())
  end

  it "renders new award form" do
    render

    assert_select "form[action=?][method=?]", awards_path, "post" do
    end
  end
end
