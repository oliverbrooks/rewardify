class Offer < ActiveRecord::Base
  attr_accessible :description, :image, :link, :name

  mount_uploader :image, ImageUploader
end
