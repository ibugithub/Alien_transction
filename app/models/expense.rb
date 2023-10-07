class Expense < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :category, class_name: 'Category'

  validates :name, presence: true, length: { maximum: 255 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
