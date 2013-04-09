class Delegato < ActiveRecord::Base
  attr_accessible :codsocio, :codtessera, :datanascita, :sezione, :socio

  has_many :presenze

  self.per_page = 10

  def self.search(key)
  	case key
  	when /\d{12}/
  	  key1=key[0..10]
	  where('codtessera = ?', "#{key1}") 
	when nil
	  nil
	else 
  	  where('socio LIKE ?', "%#{key}%")
    end
  end
end