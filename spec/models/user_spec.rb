require 'rails_helper'

RSpec.describe User, type: :model do 

  subject {User.new(name: 'Leo', age: 21 ) }
  it "Create a simple user" do 
    expect {
      User.create({name: subject.name, age: subject.age})
    }.to change(User, :count).by(1)
  end 

  it "Doesn't create user without name" do 
    subject.name = nil 
    expect {
      User.create({name: subject.name, age: subject.age})
    }.to change(User, :count).by(0)
  end

  it "Doesn't create duplicated user (unique name)" do
    User.create({name: subject.name, age: subject.age})
    expect {
      User.create({name: subject.name, age: subject.age})
    }.to change(User, :count).by(0)
  end

  it "Doesn't create unborn user" do
    subject.age = -1 
    expect {
      User.create({name: subject.name, age: subject.age})
    }.to change(User, :count).by(0)
  end
  
end
