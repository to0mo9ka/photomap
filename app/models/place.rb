class Place < ApplicationRecord
  #has_one_attached :image
  attachment :image
  validates :image, presence: true
  # mini_magickのバリエーションなどの設定も含まれていることを確認してください
  # 例: process :resize_to_limit => [800, 800]
end
