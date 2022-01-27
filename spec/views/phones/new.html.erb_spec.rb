require 'rails_helper'

RSpec.describe "phones/new", type: :view do
  before(:each) do
    assign(:phone, Phone.new(
      number: "MyString",
      segment_phone: "MyString",
      default_phone: false,
      contact: nil
    ))
  end

  it "renders new phone form" do
    render

    assert_select "form[action=?][method=?]", phones_path, "post" do

      assert_select "input[name=?]", "phone[number]"

      assert_select "input[name=?]", "phone[segment_phone]"

      assert_select "input[name=?]", "phone[default_phone]"

      assert_select "input[name=?]", "phone[contact_id]"
    end
  end
end
