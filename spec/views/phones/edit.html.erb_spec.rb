require 'rails_helper'

RSpec.describe "phones/edit", type: :view do
  before(:each) do
    @phone = assign(:phone, Phone.create!(
      number: "MyString",
      segment_phone: "MyString",
      default_phone: false,
      contact: nil
    ))
  end

  it "renders the edit phone form" do
    render

    assert_select "form[action=?][method=?]", phone_path(@phone), "post" do

      assert_select "input[name=?]", "phone[number]"

      assert_select "input[name=?]", "phone[segment_phone]"

      assert_select "input[name=?]", "phone[default_phone]"

      assert_select "input[name=?]", "phone[contact_id]"
    end
  end
end
