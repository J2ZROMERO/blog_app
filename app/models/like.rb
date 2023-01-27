class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post, foreign_key: 'posts_id'

  def self.update_likes_counter(author, likes)
    Post.find_by(author_id: author).update(LikesCounter: likes)
  end
end
