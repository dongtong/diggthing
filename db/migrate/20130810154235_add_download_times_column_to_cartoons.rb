class AddDownloadTimesColumnToCartoons < ActiveRecord::Migration
  def change
    add_column :cartoons, :download_times, :integer
  end
end
