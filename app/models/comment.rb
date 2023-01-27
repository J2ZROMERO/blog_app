class Comment < ApplicationRecord
  belongs_to :user, foreign_key: "author_id"
  belongs_to :post, foreign_key: "posts_id"
  validates :Text, presence: true

  def self.update_comments_counter(id,cuantity)
    Post.where(id: id).update(CommentsCounter: cuantity)
  end

end
