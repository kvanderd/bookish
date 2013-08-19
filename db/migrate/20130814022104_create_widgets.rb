class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.text :html_block_1
      t.string :name
      t.string :type
      t.belongs_to :page
      t.timestamps
    end
  end
end
 