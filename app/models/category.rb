class Category < ActiveRecord::Base
  has_and_belongs_to_many :groups
  
  attr_accessible :ancestry, :name, :parent_id, :group_ids
  
  has_ancestry
end
