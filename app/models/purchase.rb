class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :vendor

  scope :pending, -> { where(played: false) }

  validate :user, :vendor, :value, :access_token, presence: true

  delegate :phone, :points, to: :user

  before_create :generate_access_token
  before_create :generate_awarded_points

  def generate_access_token
    self.access_token = SecureRandom.hex[0..10]
  end

  def offer
    self.vendor.offers.first
  end

  def generate_awarded_points
    self.awarded_value = (award_scaler.to_f / 100 * offer.value).ceil
  end

  def award_scaler
    percentage_win = case rand(100)
    when 1..3
      0
    when 4..20
      10
    when 21..50
      30
    when 51..70
      50
    when 71..95
      70
    when 96..100 #jackpot!
      100
    end
  end

  def winner?
    self.offer.value < user.points_for(vendor)
  end

  def send_sms=(message)
    TWILIO_CLIENT.account.sms.messages.create(from: ENV['TWILIO_NUMBER'], to: phone, body: message)
  end

  def send_sms
    false
  end

end
