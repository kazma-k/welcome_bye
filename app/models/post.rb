class Post < ApplicationRecord
  has_one_attached :image
  # created_atカラムを降順で取得する
  scope :sorted, -> { order(created_at: :desc) }
  # ログインしているユーザーの情報のみ取得する
  scope :current_user, -> { where(user_id: current_user.id) }
end
