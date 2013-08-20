class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :difficulty, presence: true

  mount_uploader :photo, PhotoUploader
end
