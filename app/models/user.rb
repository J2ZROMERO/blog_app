class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def self.see_3recent_posts(id)
    Post.where(author_id: id).last(3)
  end
end
