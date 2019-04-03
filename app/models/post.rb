class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  # created_atカラムを降順で取得する
  scope :sorted, -> { order(created_at: :desc) }
  validates :item_name, presence: true
  validates :flag, presence: true
  validates :image, presence: true
end
