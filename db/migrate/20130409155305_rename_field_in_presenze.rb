class RenameFieldInPresenze < ActiveRecord::Migration
  def change
  	rename_column :presenze, :delegato, :isdelegato
  end

end
