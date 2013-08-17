class AddCategoryIdColToCartoons < ActiveRecord::Migration
  def change
    add_column :cartoons, :category_id, :integer
  end
end
