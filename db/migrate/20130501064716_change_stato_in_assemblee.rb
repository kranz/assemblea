class ChangeStatoInAssemblee < ActiveRecord::Migration
  def up
  	change_column :assemblee, :stato, :string
  end

  def down
  	change_column :assemblee, :stato, :integer
  end
end
