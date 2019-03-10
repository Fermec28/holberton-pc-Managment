class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :subscriptions
  has_many :computers, :through => :subscriptions
  
  validates :name, presence: true
  
  scope :by_role,  ->(role) { joins(:roles).where(roles: { name: role }) }
  
  
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:simple_user) if self.roles.blank?
  end

  def current_pc
    if (self.subscriptions.count > 0)
      computer = self.subscriptions.last.computer
    else
      nil
    end
  end
end
