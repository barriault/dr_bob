module DynamicSelect
  class FoodItemMeasurementsController < ApplicationController
    def index
      food_item = FoodItem.find(params[:food_item_id])
      @measurements = food_item.measurements.order(singular_name: :asc, prep: :asc)
    end
  end
end