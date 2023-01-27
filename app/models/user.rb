class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.see_3recent_posts(id)
    Post.where(author_id: id).last(3)
  end
end
