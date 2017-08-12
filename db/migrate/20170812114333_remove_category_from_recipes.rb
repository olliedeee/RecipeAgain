class RemoveCategoryFromRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :category
  end
end
