require 'rails_helper'

RSpec.describe "awards/edit", type: :view do
  before(:each) do
    @award = assign(:award, FactoryGirl.create(:user_award))
  end

      current_user = FactoryGirl.create(:user)
    view.define_singleton_method(:current_user) { current_user }

  it "renders the edit award form" do
    render
    assert_select "form[action=?][method=?]", award_path(@award), "post" do
    end
  end
end
