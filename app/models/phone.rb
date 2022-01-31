class Phone < ApplicationRecord
  belongs_to :contact
  validates :number, presence: true
  validates_uniqueness_of :number, scope: :contact_id
  validates_inclusion_of :default_phone, :in => [true, false]

  before_save do
    if self.default_phone
      contact.phones.where.not(id: self.id).each do |phone|
        phone.update! default_phone: false
      end
    end
  end
 end

