class AddStructureToPage < ActiveRecord::Migration
  def change
    add_column :pages, :structure, :text
  end
end
