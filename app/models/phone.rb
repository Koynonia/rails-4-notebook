class Phone < ActiveRecord::Base
  belongs_to :contact
  
  validates :contact_id, presence: true
  validates :phone, presence: true, length: { minimum: 10}
end
