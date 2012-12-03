class Password < ActiveRecord::Base
  belongs_to :category
  attr_accessible :description, :name, :password, :category, :category_id
  
  def self.all_by_category(category_id)
    return Password.where(:category_id => category_id)
  end
end
