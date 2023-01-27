class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post, foreign_key: 'posts_id'

  def self.update_comments_counter(id, cuantity)
    Post.where(id:).update(CommentsCounter: cuantity)
  end
end
