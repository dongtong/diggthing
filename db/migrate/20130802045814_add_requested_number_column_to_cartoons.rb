class AddRequestedNumberColumnToCartoons < ActiveRecord::Migration
  def change
    add_column :cartoons, :requested_number, :integer
  end
end
