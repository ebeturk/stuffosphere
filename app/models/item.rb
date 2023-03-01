class Item < ApplicationRecord
  belongs_to :user
  has_many :borrowings

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: %w[household electronics appliances clothing tools instruments wheels other] }

  STATUSES = ['available', 'unavailable']
end
