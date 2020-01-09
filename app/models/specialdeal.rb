class Specialdeal < ApplicationRecord
  belongs_to :user
  has_many :charges
  has_many :images

  validates :title, presence: true
  validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :description, presence: true
  validates :disclaimer, presence: true
end
