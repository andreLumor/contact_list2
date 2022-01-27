require 'rails_helper'

RSpec.describe Contact, type: :model do
  User.create({name:'Michael', age: 22})
  subject {Contact.new(user_id: User.first.id, name: 'Peter', born_date: DateTime.now ) }
  it "Create a simple contact" do 
    expect {
      Contact.create({user_id: subject.user_id, name: subject.name, born_date: subject.born_date})
    }.to change(Contact, :count).by(1)
  end 

  it "Doesn't create contact without name" do 
    subject.name = nil 
    expect {
      Contact.create({user_id: subject.user_id, name: subject.name, born_date: subject.born_date})
    }.to change(Contact, :count).by(0)
  end

  it "Doesn't create duplicated contact (unique name)" do
    Contact.create({user_id: subject.user_id, name: subject.name, born_date: subject.born_date})
    expect {
      Contact.create({user_id: subject.user_id, name: subject.name, born_date: subject.born_date})
    }.to change(Contact, :count).by(0)
  end
end
