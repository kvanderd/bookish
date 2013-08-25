class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
    	t.string :title
    	t.string :author_first_name
    	t.string :author_last_name
    	t.text :copyright_info
    	t.belongs_to :user
      t.timestamps
    end
  end
end
