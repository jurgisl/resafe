class User < ActiveRecord::Base
  has_and_belongs_to_many :groups
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :trackable, :validatable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  def group?(group)
    return !!self.groups.find_by_name(group.to_s.camelize)
  end
end
