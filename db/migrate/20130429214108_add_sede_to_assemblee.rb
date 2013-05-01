class AddSedeToAssemblee < ActiveRecord::Migration
  def change
    add_column :assemblee, :sede, :string
  end
end
