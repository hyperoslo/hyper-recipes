class AddSeedRecipesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :seed_recipes, :boolean, default: false
  end
end
