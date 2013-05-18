class Purchase < ActiveRecord::Base
  attr_accessible :notes, :user_id, :value, :vendor_id

  belongs_to :user
  belongs_to :vendor
  belongs_to :offer

  validate :user, :vendor, :value, :access_token, presence: true

  delegate :phone, :points, to: :user

  before_save :generate_access_token

  def generate_access_token
    self.access_token = SecureRandom.hex[0..10]
  end
end
