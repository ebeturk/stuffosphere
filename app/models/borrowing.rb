class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validate :no_overlapping_borrowings

  def no_overlapping_borrowings
    if item.borrowings.where("(start_time <= ? AND end_time >= ?) OR (start_time <= ? AND end_time >= ?) OR (start_time >= ? AND end_time <= ?)", start_time, start_time, end_time, end_time, start_time, end_time).any?
      errors.add(:base, "Item is already borrowed for these dates.")
    end
  end
end
