class Measurement < ApplicationRecord
  
  belongs_to :food_item
  
  before_validation :calculate_values, on: :create
  
  validates :singular_name, uniqueness: { scope: [:food_item_id, :prep] }
  validates :singular_name, presence: true
  validate  :si_units_match_food_item
  validates :calories, :protein, :carbs, :fat, :fiber, :si_dimension, numericality: :greater_than_or_equal_to_zero
  
  def name
    name = self.singular_name
    name += ", #{self.prep}" unless self.prep.blank?
    return name
  end
  
  def calculate_values
    if self.si_dimension
      conversion_factor = self.si_dimension / self.food_item.si_dimension
      
      self.calories = (self.food_item.calories * conversion_factor).round(1)
      self.protein = (self.food_item.protein * conversion_factor).round(1)
      self.carbs = (self.food_item.carbs * conversion_factor).round(1)
      self.fat = (self.food_item.fat * conversion_factor).round(1)
      self.fiber = (self.food_item.fiber * conversion_factor).round(1)
    end
  end
  
  def si_units_match_food_item
    unless self.food_item.si_units.eql?(self.si_units)
      self.errors.add(:si_units, "must match that of Food Item")
    end
  end
end
