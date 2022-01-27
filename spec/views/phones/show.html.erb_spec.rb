require 'rails_helper'

RSpec.describe "phones/show", type: :view do
  before(:each) do
    @phone = assign(:phone, Phone.create!(
      number: "Number",
      segment_phone: "Segment Phone",
      default_phone: false,
      contact: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Segment Phone/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
