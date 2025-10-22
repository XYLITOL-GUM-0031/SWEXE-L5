class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy       # ツイート削除時にいいねも削除
  has_many :like_users, through: :likes, source: :user

  # いいねする
  def like(user)
    likes.create(user_id: user.id)
  end

  # いいねを取り消す
  def unlike(user)
    likes.find_by(user_id: user.id)&.destroy
  end

  # いいね済みか確認
  def liked?(user)
    like_users.include?(user)
  end
end
