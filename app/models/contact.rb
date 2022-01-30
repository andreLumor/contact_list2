class Contact < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :user_id
  has_many :phones, dependent: :destroy
  accepts_nested_attributes_for :phones, reject_if: lambda { |a| a[:number].blank? }, allow_destroy: true
end
