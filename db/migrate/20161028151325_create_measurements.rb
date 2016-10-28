class CreateMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :measurements do |t|
      t.references :food_item, foreign_key: true
      
      t.string :singular_name, index: true
      t.string :prep
      
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
