class AddIndexToSoci < ActiveRecord::Migration
  def change
  	add_index :soci, :socio
  	add_index :soci, :codtessera
  end
end
