class CreateDelegati < ActiveRecord::Migration
  def change
    create_table :delegati do |t|
      t.string :socio
      t.string :codsocio
      t.string :codtessera
      t.date :datanascita
      t.string :sezione

      t.timestamps
    end
  end
end
