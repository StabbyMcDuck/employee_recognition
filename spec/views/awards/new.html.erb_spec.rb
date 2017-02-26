require 'rails_helper'

RSpec.describe "awards/new", type: :view do
 
  before(:each) do
     @award = assign(:award, FactoryGirl.create(:user_award))
      current_user = FactoryGirl.create(:user)
      view.define_singleton_method(:current_user) { current_user }
  end

  it "renders new award form" do
    render
    end
  end
end
