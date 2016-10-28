class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.references :recipe, foreign_key: true
      t.references :food_item, foreign_key: true
      t.references :measurement, foreign_key: true
      
      t.float      :quantity
      t.string     :prep
      
      t.float  :calories
      t.float  :protein
      t.float  :carbs
      t.float  :fat
      t.float  :fiber
      
      t.timestamps
    end
  end
end