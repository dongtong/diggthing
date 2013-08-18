class AddCategoryIdColToScrapSources < ActiveRecord::Migration
  def change
    add_column :scrap_sources, :category_id, :integer
  end
end
