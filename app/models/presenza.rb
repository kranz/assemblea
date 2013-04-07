class Presenza < ActiveRecord::Base
  attr_accessible :assemblea_id, :delegato, :presente, :socio_id

  belongs_to :socio
  belongs_to :assemblea
end
