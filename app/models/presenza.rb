class Presenza < ActiveRecord::Base
  attr_accessible :assemblea_id, :isdelegato, :presente, :socio_id, :delegato_id

  belongs_to :socio
  belongs_to :delegato
  belongs_to :assemblea
end
