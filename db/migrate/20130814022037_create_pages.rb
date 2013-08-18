class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
    	t.string :name
    	t.belongs :story
      t.timestamps
    end
  end
end
