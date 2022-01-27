class User < ApplicationRecord
  validates :name, presence: true , uniqueness: true 
  validates :age, numericality: { greater_than: 0 }
  has_many :contacts, dependent: :destroy
  has_many :phones, through: :contacts
end
