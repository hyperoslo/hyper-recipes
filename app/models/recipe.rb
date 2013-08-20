class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :difficulty, presence: true
end
