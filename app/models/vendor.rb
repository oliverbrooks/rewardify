class Vendor < ActiveRecord::Base

  belongs_to :user
  has_many :offers
  has_many :purchases

  def to_s
    name
  end
end
