class AddPhotoToSezioni < ActiveRecord::Migration
  def up
  	    add_attachment :sezioni, :foto
  end
  def down
  	    remove_attachment :sezioni, :foto
  end  
end
