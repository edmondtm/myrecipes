class RemoveIdFromRecipe < ActiveRecord::Migration
  def change
    remove_column :recipes, :id, :integer
  end
end
