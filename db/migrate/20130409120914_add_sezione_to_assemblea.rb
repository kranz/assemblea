class AddSezioneToAssemblea < ActiveRecord::Migration
  def change
    add_column :assemblee, :sezione_id, :integer
  end
end
