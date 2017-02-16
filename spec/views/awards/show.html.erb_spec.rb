require 'rails_helper'

RSpec.describe "awards/show", type: :view do
  before(:each) do
    @award = assign(:award, Award.create())
  end

  it "renders attributes in <p>" do
    render
  end
end
