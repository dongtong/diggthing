class CreateScrapSources < ActiveRecord::Migration
  def change
    create_table :scrap_sources do |t|
      t.string :name
      t.string :src_url
      t.integer :total_pages
      t.integer :curr_page

      t.timestamps
    end
  end
end
