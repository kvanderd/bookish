class AddHtmlBlock1ToWidget < ActiveRecord::Migration
  def change
    add_column :widgets, :html_block_1, :text
  end
end
