class Food < ApplicationRecord
  has_many :recipe_foods
  belongs_to :user

  attribute :quantity. default: 1

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { only_integer: true, greater_than: 0 }
end
