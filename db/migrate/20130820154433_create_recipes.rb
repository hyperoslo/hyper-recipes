class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.text :description
      t.text :instructions
      t.boolean :favorite
      t.integer :difficulty, null: false

      t.timestamps
    end
  end
end
