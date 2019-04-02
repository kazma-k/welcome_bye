class Post < ApplicationRecord
  has_one_attached :image
  # created_atカラムを降順で取得する
  scope :sorted, -> { order(created_at: :desc) }

  def self.search(search)
      if search
        Post.where(['item_name LIKE (?)', "%#{search}%"])
      else
        Post.all
      end
    end
end
