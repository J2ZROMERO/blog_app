class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post, foreign_key: 'posts_id'

  def self.update_comments_counter(ide, cuantity)
    Post.where(id: ide).update(CommentsCounter: cuantity)
  end
end
