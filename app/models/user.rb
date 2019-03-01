class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :registrations
  has_many :computers, :through => :registrations

  def current_pc
    if (self.registrations.count > 0)
      self.registrations.last.computer
    else
      nil
    end
  end
end
