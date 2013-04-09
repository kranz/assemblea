class AddFieldToPresenze < ActiveRecord::Migration
  def change
    add_column :presenze, :delegato_id, :integer
  end
end
