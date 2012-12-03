class Password < ActiveRecord::Base
  belongs_to :category
  attr_accessible :description, :name, :password, :category
end
