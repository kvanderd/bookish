class DropUnneededModels < ActiveRecord::Migration
  def change
    drop_table :widget_factories
    drop_table :blobs
    
  end
end
