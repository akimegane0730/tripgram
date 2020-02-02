class Like < ApplicationRecord

  belongs_to :user
  belongs_to :post

  # オブジェクトが保存される直前に、属性の値が一意（unique）であり重複していないことを検証する記述
  validates :user_id, uniqueness: { scope: :post_id }
end
