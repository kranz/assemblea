class CreateAssemblee < ActiveRecord::Migration
  def change
    create_table :assemblee do |t|
      t.string :nome
      t.date :data
      t.integer :stato
      t.string :eliminato
      t.string :presidente
      t.time :orainizio
      t.time :orafine

      t.timestamps
    end
  end
end
