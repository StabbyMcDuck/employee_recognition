require 'rails_helper'

RSpec.describe "awards/edit", type: :view do

  current_user = FactoryGirl.create(:user)

  before(:each) do
    @award = assign(:award, FactoryGirl.create(:user_award))
  end

  it "renders the edit award form" do
    render
    assert_select "form[action=?][method=?]", award_path(@award), "post" do
    end
  end
end
