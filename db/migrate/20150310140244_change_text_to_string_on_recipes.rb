class ChangeTextToStringOnRecipes < ActiveRecord::Migration
  def up
    change_column :recipes, :description, :string
    change_column :recipes, :instructions, :string
  end

  def down
    change_column :recipes, :description, :text
    change_column :recipes, :instructions, :text
  end
end
