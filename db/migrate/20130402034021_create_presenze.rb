class CreatePresenze < ActiveRecord::Migration
  def change
    create_table :presenze do |t|
      t.integer :socio_id
      t.string :delegato
      t.string :presente
      t.integer :assemblea_id

      t.timestamps
    end
  end
end
