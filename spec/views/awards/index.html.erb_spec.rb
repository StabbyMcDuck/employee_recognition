require 'rails_helper'

RSpec.describe "awards/index", type: :view do
  before(:each) do
    assign(:awards, [:user_award, :non_user_award].map { |factory|
      FactoryGirl.create(factory)
    })

    current_user = FactoryGirl.create(:user)
    view.define_singleton_method(:current_user) { current_user }
  end

  it "renders a list of awards" do
    render
  end
end
