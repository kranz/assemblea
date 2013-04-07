class AddIndexToSezioni < ActiveRecord::Migration
  def change
  	add_index :soci, :sezione
  end
end
