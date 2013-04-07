class Assemblea < ActiveRecord::Base
  attr_accessible :data, :eliminato, :nome, :orafine, :orainizio, :presidente, :stato

  has_many :presenze
end
