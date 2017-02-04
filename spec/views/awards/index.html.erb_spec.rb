require 'rails_helper'

RSpec.describe "awards/index", type: :view do
  before(:each) do
    assign(:awards, [
      Award.create!(
        :type => "Type",
        :employeename => "Employeename",
        :employeeemail => "Employeeemail",
        :grantedby => "Grantedby",
        :user => nil
      ),
      Award.create!(
        :type => "Type",
        :employeename => "Employeename",
        :employeeemail => "Employeeemail",
        :grantedby => "Grantedby",
        :user => nil
      )
    ])
  end

  it "renders a list of awards" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Employeename".to_s, :count => 2
    assert_select "tr>td", :text => "Employeeemail".to_s, :count => 2
    assert_select "tr>td", :text => "Grantedby".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
