class Address < ActiveRecord::Base
  belongs_to :contact
  
  validates :street, presence: true, length: { maximum: 50}
  validates :city, presence: true, length: { maximum: 50}
  validates :state, presence: true, length: { minimum: 2}
end
