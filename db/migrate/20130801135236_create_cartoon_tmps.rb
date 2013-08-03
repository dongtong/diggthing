class CreateCartoonTmps < ActiveRecord::Migration
  def change
    create_table :cartoon_tmps do |t|
      t.string :title
      t.string :thumb_pic_url
      t.string :details_url
      t.boolean :scraped

      t.timestamps
    end
  end
end
