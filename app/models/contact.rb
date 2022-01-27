class Contact < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :user_id
  has_many :phones, dependent: :destroy
end
