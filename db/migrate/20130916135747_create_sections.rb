class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :book
      t.text :content

      t.timestamps
    end
    add_index :sections, :book_id
  end
end
