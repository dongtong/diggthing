class AddDownloadLinkColToBook < ActiveRecord::Migration
  def change
    add_column :books, :download_link, :string
  end
end
