class CreateSezioni < ActiveRecord::Migration
  def change
    create_table :sezioni do |t|
      t.string :nome

      t.timestamps
    end
  end
end
