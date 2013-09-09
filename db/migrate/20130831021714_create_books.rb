class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :publisher
      t.datetime :published_at
      t.integer :book_coin
      t.boolean :published

      t.timestamps
    end
  end
end
