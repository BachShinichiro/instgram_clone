class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favorite_users, through: :favorites, source: :user
  has_many :favorites, dependent: :destroy
  validates :content,  presence: true
end
