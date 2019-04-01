class Post < ApplicationRecord
  has_one_attached :image
  # created_atカラムを降順で取得する
  scope :sorted, -> { order(created_at: :desc) }

end
