class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username, :password_digest
    	t.boolean :author
      t.timestamps
    end
  end
end
