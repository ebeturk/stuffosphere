class Item < ApplicationRecord
  belongs_to :user
  has_many :borrowings
  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: %w[Household Electronics Appliances Clothing Tools Instruments Wheels Other] }

  STATUSES = ['available', 'unavailable']
end
