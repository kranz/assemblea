class AddCondelegaToPresenze < ActiveRecord::Migration
  def change
    add_column :presenze, :condelega, :string
  end
end
