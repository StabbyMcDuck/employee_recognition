require 'rails_helper'

RSpec.describe "awards/new", type: :view do
  before(:each) do
    assign(:award, Award.new(
      :type => "",
      :employeename => "MyString",
      :employeeemail => "MyString",
      :grantedby => "MyString",
      :user => nil
    ))
  end

  it "renders new award form" do
    render

    assert_select "form[action=?][method=?]", awards_path, "post" do

      assert_select "input#award_type[name=?]", "award[type]"

      assert_select "input#award_employeename[name=?]", "award[employeename]"

      assert_select "input#award_employeeemail[name=?]", "award[employeeemail]"

      assert_select "input#award_grantedby[name=?]", "award[grantedby]"

      assert_select "input#award_user_id[name=?]", "award[user_id]"
    end
  end
end
