class CreateWidgetTemplates < ActiveRecord::Migration
  def change
    create_table :widget_templates do |t|
      t.string :name
      t.string :classtype
      t.text :code

      t.timestamps
    end
  end
end
