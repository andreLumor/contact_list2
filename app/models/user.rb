class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true , uniqueness: true 
  validates :age, numericality: { greater_than: 0 }
  has_many :contacts, dependent: :destroy
  has_many :phones, through: :contacts

  after_create_commit { broadcast_append_to "users"}
  after_destroy_commit { broadcast_remove_to "users"}
  after_update_commit { broadcast_update_to "users"}
end
