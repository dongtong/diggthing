class CreateCartoons < ActiveRecord::Migration
  def change
    create_table :cartoons do |t|
      t.string :title
      t.integer :download_number
      t.integer :cost_money

      t.timestamps
    end
  end
end
