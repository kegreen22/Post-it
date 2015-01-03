class RemoveUserIdFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :post_id_id, :integer
    remove_column :categories, :category_id_id, :integer
  end
end
