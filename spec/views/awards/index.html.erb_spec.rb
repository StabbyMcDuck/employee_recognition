require 'rails_helper'

RSpec.describe "awards/index", type: :view do
  before(:each) do
    assign(:awards, [
      Award.create(),
      Award.create()
    ])
  end

  it "renders a list of awards" do
    render
  end
end
