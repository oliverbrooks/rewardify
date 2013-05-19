class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :vendors
  has_many :purchases
  has_many :offers, through: :purchases

  def admin?
    self.id == 1
  end

  def points_for(vendor)
    played = purchases.where(played: true, vendor: vendor).sum(:awarded_value)
    unplayed = purchases.where(played: false, vendor: vendor).sum(:value)

    played + unplayed
  end
  
end
