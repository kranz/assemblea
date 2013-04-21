class Sezione < ActiveRecord::Base
  attr_accessible :nome, :foto
  has_many :assemblee
  has_attached_file :foto, 
                    :styles => { :medium => "200x200>", 
  	                             :thumb => "100x100>" 
  	                }, 
  	                :default_url => ":style/negozio.png",
  	                :convert_options => {
  	                	:medium => "-gravity center -extent '200x200'",
  	                    :thumb => "-gravity center -extent '100x100'"
  	                }
end
