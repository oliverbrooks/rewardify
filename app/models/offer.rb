class Offer < ActiveRecord::Base
  attr_accessible :description, :image, :link, :name, :value

  mount_uploader :image, ImageUploader

  validate :name, :description, :value, :image, presence: true
end
