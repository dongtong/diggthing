class AddSectionNumberColToSections < ActiveRecord::Migration
  def change
    add_column :sections, :section_number, :float
  end
end
