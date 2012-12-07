class Password < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :keywords
  attr_accessible :description, :name, :password, :category, :category_id
  
  after_save :save_keywords
  
  def self.search(phrase)
    Password.joins(:keywords).scoped(:conditions => ["keyword like ?", "#{phrase.downcase}%"]).group("passwords.id")
  end
  
  def self.all_by_category(category_id)
    return Password.where(:category_id => category_id)
  end
  
  def generate_keywords
    keywords = []
    keywords.push self.name
    keywords.push self.category.name if !self.category.nil?
    keywords |= self.description.scan(/\w+/)
    keywords.map { |x| x.downcase }
  end
  
  def save_keywords
    self.keywords.clear
    keywords = []
    self.generate_keywords.each do |word|
      keywords.push Keyword.find_or_create_by_keyword word
    end
    self.keywords = keywords
  end
end
