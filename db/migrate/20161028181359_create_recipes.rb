class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title, index: true
      
      t.text   :description
      t.text   :instructions
      
      t.float  :calories
      t.float  :protein
      t.float  :carbs
      t.float  :fat
      t.float  :fiber
      
      t.float  :servings

      t.timestamps
    end
  end
end
