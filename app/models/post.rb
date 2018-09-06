class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 2200 }
  validates :image, presence:true

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
end
