require 'rails_helper'

RSpec.describe "awards/show", type: :view do
  before(:each) do
    @award = assign(:award, Award.create!(
      :type => "Type",
      :employeename => "Employeename",
      :employeeemail => "Employeeemail",
      :grantedby => "Grantedby",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Employeename/)
    expect(rendered).to match(/Employeeemail/)
    expect(rendered).to match(/Grantedby/)
    expect(rendered).to match(//)
  end
end
