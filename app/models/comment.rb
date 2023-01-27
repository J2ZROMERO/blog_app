class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_comments_counter(id, cuantity)
    Post.where(id:).update(CommentsCounter: cuantity)
  end
end
