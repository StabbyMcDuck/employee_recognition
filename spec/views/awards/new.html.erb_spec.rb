require 'rails_helper'

RSpec.describe "awards/new", type: :view do
  before(:each) do
    assign(:award, Award.new())
    current_user = stub_model(:User)    
    allow(view).to receive(:current_user).and_return(current_user)
  end

  it "renders new award form" do
    render

    assert_select "form[action=?][method=?]", awards_path, "post" do
    end
  end
end
