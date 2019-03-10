class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :subscriptions
  has_many :computers, :through => :subscriptions
  validates :name, presence: true

  def current_pc
    if (self.subscriptions.count > 0)
      computer = self.subscriptions.last.computer
    else
      nil
    end
  end
end
