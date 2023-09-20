class Category < ApplicationRecord
  has_many :expenses, foreign_key: 'category_id'
  belongs_to :user, class_name: 'User'

  validates :name, presence: true, length: { maximum: 255 }
end
