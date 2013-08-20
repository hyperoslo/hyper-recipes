class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.string :instructions
      t.boolean :favorite
      t.decimal :difficulty

      t.timestamps
    end
  end
end
