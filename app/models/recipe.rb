class Recipe < ApplicationRecord
  
  has_many :ingredients, dependent: :destroy
  
  before_validation :update_cached_values
  
  validates :title, uniqueness: true
  validates :title, :description, :instructions, presence: true
  validates :servings, numericality: :greater_than_or_equal_to_zero
  
  def update_cached_values
    self.calories = self.ingredients.sum(:calories)
    self.protein = self.ingredients.sum(:protein)
    self.carbs = self.ingredients.sum(:carbs)
    self.fat = self.ingredients.sum(:fat)
    self.fiber = self.ingredients.sum(:fiber)
  end
  
end
