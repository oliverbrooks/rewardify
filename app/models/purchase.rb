class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :vendor
  belongs_to :offer

  scope :pending, -> { where(played: false) }

  validate :user, :vendor, :value, :access_token, presence: true

  delegate :phone, :points, to: :user

  before_create :generate_access_token
  before_create :generate_awarded_points

  def generate_access_token
    self.access_token = SecureRandom.hex[0..10]
  end

  def generate_awarded_points
    # random number = rand(0..200).to_f / 100 * value
    # awarded_value = random_number.ceil

  
    percentage_win = case rand(1..100)
    when 1..5
      0
    when 6..20
      10
    when 21..50
      50
    when 70..95
      70
    when 96..100 #jackpot!
      100
    end

    awarded_value = percentage_win / 100 * offer.value

   
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
