class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.string :description
      t.string :instructions
      t.boolean :favorite
      t.decimal :difficulty, null: false

      t.timestamps
    end
  end
end
