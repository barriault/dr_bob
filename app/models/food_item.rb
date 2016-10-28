class FoodItem < ApplicationRecord
  
  has_many :measurements, dependent: :destroy
  
  validates :name, uniqueness: { scope: :brand }
  validates :name, :si_units, presence: true
  validates :calories, :protein, :carbs, :fat, :fiber, :si_dimension, numericality: :greater_than_or_equal_to_zero

end
