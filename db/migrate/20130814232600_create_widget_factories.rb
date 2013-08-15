class CreateWidgetFactories < ActiveRecord::Migration
  def change
    create_table :widget_factories do |t|
      t.string :name

      t.timestamps
    end
  end
end
