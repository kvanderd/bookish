class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :username
    	t.boolean :author 
      t.timestamps
    end
  end
end
