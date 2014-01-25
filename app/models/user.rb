class User < ActiveRecord::Base
  # has_many :user_roles
  # has_many :roles, :through => :user_roles
  has_and_belongs_to_many :roles
  has_many :bets
  has_many :events, :through => :bets

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :role_ids

  def has_role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

  def answered?(event_id)
    return !!self.bets.find_by_event_id(event_id)
  end

  def answer (event_id)
    if answered? event_id
      b = bets.find_by_event_id(event_id)
      return b.answer_name
    else
      return ''
    end
  end

end
