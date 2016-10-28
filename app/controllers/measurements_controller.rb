class MeasurementsController < ApplicationController
  before_action :set_food_item, only: [:new, :create]
  before_action :set_measurement, only: [:edit, :update, :destroy]

  def new
    @measurement = @food_item.measurements.build
  end

  def edit
    @food_item = @measurement.food_item
  end

  def create
    @measurement = @food_item.measurements.build(measurement_params)

    if @measurement.save
      redirect_to @food_item, notice: 'Measurement was successfully created.'
    else
      render :new
    end
  end

  def update
    @food_item = @measurement.food_item
    if @measurement.update(measurement_params)
      redirect_to @measurement.food_item, notice: 'Measurement was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @food_item = @measurement.food_item
    @measurement.destroy
    redirect_to @food_item, notice: 'Measurement was successfully destroyed.'
  end

  private
    def set_measurement
      @measurement = Measurement.find(params[:id])
    end
    
    def set_food_item
      @food_item = FoodItem.find(params[:food_item_id])
    end

    def measurement_params
      params.require(:measurement).permit(:singular_name, :prep, :calories, :protein, :carbs, :fat, :fiber, :si_dimension, :si_units)
    end
end
