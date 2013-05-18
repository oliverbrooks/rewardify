class Vendor < ActiveRecord::Base

  belongs_to :user
  has_many :offers

  def to_s
    name
  end
end
