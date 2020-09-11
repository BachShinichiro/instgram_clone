class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user, through: :favorites, source: :user
  has_many :favorites, dependent: :destroy
end
