class Role < ActiveRecord::Base
  # has_many :user_roles
  # has_many :roles, :through => :user_roles
  has_and_belongs_to_many :users

  attr_accessible :name
end