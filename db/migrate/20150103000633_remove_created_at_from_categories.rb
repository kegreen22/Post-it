class RemoveCreatedAtFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :created_at, :datetime
    remove_column :categories, :updated_at, :datetime
  end
end
