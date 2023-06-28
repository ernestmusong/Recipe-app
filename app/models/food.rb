class Food < ApplicationRecord
  has_many :recipe_foods
  belongs_to :user

  attribute :quantity, :integer, default: 1
  attribute :value, :interger

  validates :quantity, numericality: { greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }

  def calculate_value
    self.value = price * quantity
  end
end
