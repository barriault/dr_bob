class CreateFoodItems < ActiveRecord::Migration[5.0]
  def change
    create_table :food_items do |t|
      t.string :name, index: true
      t.string :brand, index: true
      
      t.float  :calories
      t.float  :protein
      t.float  :carbs
      t.float  :fat
      t.float  :fiber
      
      t.float  :si_dimension
      t.string :si_units
      
      t.timestamps
    end
  end
end
