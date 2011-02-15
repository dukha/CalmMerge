class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :subdomain, :email, :password, :password_confirmation, :remember_me , :role_ids, :role_symbols

  # relationships
  has_many :user_roles
  has_many :roles, :through => :user_roles

  # for declarative auth
  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end
end
