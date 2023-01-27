class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_likes_counter(author, likes)
    Post.find_by(author_id: author).update(LikesCounter: likes)
  end
end
