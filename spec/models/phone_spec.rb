require 'rails_helper'


RSpec.describe Phone, type: :model do
  User.create({name:'Raph', age: 22})
  Contact.create({user_id: User.first.id, name: 'John', born_date: 2022-01-21})
  subject {Phone.new(contact_id: User.first.contacts.first.id, number: '123', default_phone: true ) }
  it "creates a phone in a contact list" do 
    expect {
      Phone.create({contact_id: subject.contact_id, number: subject.number, default_phone: subject.default_phone})
    }.to change(Phone, :count).by(1)
  end
  
  it "Doesn't create phone without number" do 
    subject.number = nil 
    expect {
      Phone.create({contact_id: subject.contact_id, number: subject.number, default_phone: subject.default_phone})
    }.to change(Phone, :count).by(0)
  end

  it "Doesn't create duplicated numbers for the same contact" do
    Phone.create({contact_id: subject.contact_id, number: subject.number, default_phone: subject.default_phone})
    expect {
      Phone.create({contact_id: subject.contact_id, number: subject.number, default_phone: subject.default_phone})
    }.to change(Phone, :count).by(0)
  end

  context "Creating new default phone" do 
    setup do
      Phone.create({contact_id: subject.contact_id, number: subject.number, default_phone: true})
      @old_default = User.first.contacts.first.phones.where(default_phone: true)
      Phone.create({contact_id: subject.contact_id, number: subject.number*2, default_phone: true})
      @new_default = User.first.contacts.first.phones.where(default_phone: true)
    end 
    it "Doesn't have multiple default_phones" do
      expect(User.first.contacts.first.phones.where(default_phone: true).count).to be(1)
    end
    it 'Changes the default_phone' do 
      expect(@old_default).not_to eql(@new_default)
    end 
  end
end
