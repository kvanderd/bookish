class RenameHtmlBlockColumn < ActiveRecord::Migration
  def up
  	rename_column :widgets, :html_block_1, :data
  end

  def down
  	rename_column :widgets, :data, :html_block_1 
  end
end
