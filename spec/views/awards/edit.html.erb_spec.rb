require 'rails_helper'

RSpec.describe "awards/edit", type: :view do
  before(:each) do
  	view.stub(:current_user) { User.new # return a user }
    @award = assign(:award, FactoryGirl.create(:user_award))
  end

  it "renders the edit award form" do
    render

    assert_select "form[action=?][method=?]", award_path(@award), "post" do
    end
  end
end
