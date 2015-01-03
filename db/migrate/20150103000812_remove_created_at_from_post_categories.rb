class RemoveCreatedAtFromPostCategories < ActiveRecord::Migration
  def change
    remove_column :post_categories, :created_at, :datetime
    remove_column :post_categories, :updated_at, :datetime
  end
end
