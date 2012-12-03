class Category < ActiveRecord::Base
  attr_accessible :ancestry, :name
  
  has_ancestry
end
