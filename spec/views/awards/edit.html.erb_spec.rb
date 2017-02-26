require 'rails_helper'

RSpec.describe "awards/edit", type: :view do
  before(:each) do
    @award = assign(:award, FactoryGirl.create(:user_award))
    current_user = stub_model(:User)    
    allow(view).to receive(:current_user).and_return(current_user)
  end

  it "renders the edit award form" do
    render

    assert_select "form[action=?][method=?]", award_path(@award), "post" do
    end
  end
end
