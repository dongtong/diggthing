class AddScrapSourceIdColToCartoonTmpsAndCartoons < ActiveRecord::Migration
  def change
    add_column :cartoon_tmps, :scrap_source_id, :integer
    add_column :cartoons, :scrap_source_id, :integer
  end
end
