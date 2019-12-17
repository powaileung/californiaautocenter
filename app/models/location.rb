class Location < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode 
  
  validates :name, presence: true
end
