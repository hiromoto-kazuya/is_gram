class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 2200 }
end
