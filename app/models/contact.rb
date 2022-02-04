class Contact < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :user_id
  has_many :phones, dependent: :destroy
  accepts_nested_attributes_for :phones, reject_if: lambda { |a| a[:number].blank? }, allow_destroy: true

  after_create_commit { broadcast_append_to "contacts"}
  after_destroy_commit { broadcast_remove_to "contacts"}
  after_update_commit { broadcast_update_to "contacts"}
end
