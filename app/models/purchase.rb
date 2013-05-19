class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :vendor
  belongs_to :offer

  scope :pending, -> { where(played: false) }

  validate :user, :vendor, :value, :access_token, presence: true

  delegate :phone, :points, to: :user

  before_create :generate_access_token

  def generate_access_token
    self.access_token = SecureRandom.hex[0..10]
  end

  def send_offer_message
    TWILIO_CLIENT.account.sms.messages.create(from: ENV['TWILIO_NUMBER'], to: phone, body: play_game_message)
  end

  def play_game_message
    "You've been awarded #{value} points. Click this link for a chance to double your points #{play_game_link}"
  end

  def play_game_link
    Rails.application.routes.url_helpers.play_url(t: access_token)
  end

end
