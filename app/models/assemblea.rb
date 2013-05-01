class Assemblea < ActiveRecord::Base
  attr_accessible :data, :eliminato, :nome, :orafine, :orainizio, :presidente, :stato, :sezione_id, :generale, :sede

  has_many :presenze
  belongs_to :sezione
end
