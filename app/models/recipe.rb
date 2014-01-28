class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :difficulty, presence: true, inclusion: { in: 1..3 }
  mount_uploader :photo, PhotoUploader
end
