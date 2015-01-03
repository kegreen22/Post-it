class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.references :post_id, index: true
      t.references :category_id, index: true
      t.timestamps
    end
  end
end
