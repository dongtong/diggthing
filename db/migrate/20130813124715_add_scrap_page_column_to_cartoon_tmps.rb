class AddScrapPageColumnToCartoonTmps < ActiveRecord::Migration
  def change
    add_column :cartoon_tmps, :scrap_page, :integer
  end
end
