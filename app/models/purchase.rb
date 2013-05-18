class Purchase < ActiveRecord::Base
  attr_accessible :notes, :user_id, :value, :vendor_id

  belongs_to :user
  belongs_to :vendor
  belongs_to :offer

  validate :phone, :user, :value, presence: true
end
