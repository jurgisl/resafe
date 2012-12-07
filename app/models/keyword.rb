class Keyword < ActiveRecord::Base
  attr_accessible :keyword
  
  has_and_belongs_to_many :passwords
end
