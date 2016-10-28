class Ingredient < ApplicationRecord
  
  belongs_to :recipe
  belongs_to :food_item
  belongs_to :measurement
  
  before_validation :update_cached_values
  
  after_save :update_recipe
  after_destroy :update_recipe
  
  validates :food_item_id, uniqueness: { scope: :recipe_id }
  validates :quantity, numericality: :greater_than_or_equal_to_zero
  
  def food_item_name
    self.food_item.name
  end
  
  def measurement_name
    name = self.measurement.singular_name.pluralize(self.quantity)
    name += ", #{self.measurement.prep}" unless self.measurement.prep.blank?
    return name
  end
  
  def update_cached_values
    if quantity && food_item
      self.calories = self.quantity * food_item.calories
      self.protein = self.quantity * food_item.protein
      self.carbs = self.quantity * food_item.carbs
      self.fat = self.quantity * food_item.fat
      self.fiber = self.quantity * food_item.fiber
    end
  end
  
  def update_recipe
    recipe.update_cached_values
    recipe.save(validate: false)
  end
  
end
