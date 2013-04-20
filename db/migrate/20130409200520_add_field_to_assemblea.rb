class AddFieldToAssemblea < ActiveRecord::Migration
  def change
    add_column :assemblee, :generale, :boolean
  end
end