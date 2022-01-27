require 'rails_helper'

RSpec.describe "phones/index", type: :view do
  before(:each) do
    assign(:phones, [
      Phone.create!(
        number: "Number",
        segment_phone: "Segment Phone",
        default_phone: false,
        contact: nil
      ),
      Phone.create!(
        number: "Number",
        segment_phone: "Segment Phone",
        default_phone: false,
        contact: nil
      )
    ])
  end

  it "renders a list of phones" do
    render
    assert_select "tr>td", text: "Number".to_s, count: 2
    assert_select "tr>td", text: "Segment Phone".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
