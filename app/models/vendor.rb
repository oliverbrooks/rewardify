class Vendor < ActiveRecord::Base

  belongs_to :user
  has_many :users, through: :purchases
  has_many :offers
  has_many :purchases

  mount_uploader :logo, ImageUploader

  def to_s
    name
  end
end
