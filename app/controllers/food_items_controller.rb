class FoodItemsController < ApplicationController
  before_action :set_food_item, only: [:show, :edit, :update, :destroy]

  def index
    @food_items = FoodItem.order(name: :asc)
  end

  def show
  end

  def new
    @food_item = FoodItem.new
  end

  def edit
  end

  def create
    @food_item = FoodItem.new(food_item_params)

    if @food_item.save
      redirect_to @food_item, notice: 'Food Item was successfully created.'
    else
      render :new
    end
  end

  def update
    if @food_item.update(food_item_params)
      redirect_to @food_item, notice: 'Food Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @food_item.destroy
    redirect_to food_items_url, notice: 'Food Item was successfully destroyed.'
  end

  private
    def set_food_item
      @food_item = FoodItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_item_params
      params.require(:food_item).permit(:name, :brand, :calories, :protein, :carbs, :fat, :fiber, :si_dimension, :si_units)
    end
end
