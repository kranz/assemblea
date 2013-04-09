class Sezione < ActiveRecord::Base
  attr_accessible :nome
  has_many :assemblee
end
