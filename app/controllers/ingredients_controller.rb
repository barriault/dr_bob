class IngredientsController < ApplicationController
  before_action :set_recipe, only: [:new, :create]
  before_action :set_ingredient, only: [:edit, :update, :destroy]

  def new
    @ingredient = @recipe.ingredients.build
  end

  def edit
    @recipe = @ingredient.recipe
  end

  def create
    @ingredient = @recipe.ingredients.build(ingredient_params)

    if @ingredient.save
      redirect_to @recipe, notice: 'Ingredient was successfully created.'
    else
      render :new
    end
  end

  def update
    @recipe = @ingredient.recipe
    if @ingredient.update(ingredient_params)
      redirect_to @ingredient.recipe, notice: 'Ingredient was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @recipe = @ingredient.recipe
    @ingredient.destroy
    redirect_to @recipe, notice: 'Ingredient was successfully destroyed.'
  end

  private
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end
    
    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:food_item_id, :measurement_id, :prep, :quantity)
    end
end
