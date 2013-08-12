class AddShowTimesColumnToCartoons < ActiveRecord::Migration
  def change
    add_column :cartoons, :show_times, :integer
  end
end
