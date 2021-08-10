class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :postimage
  validates :body, length: { minimum: 1, maximum: 280 }
end
