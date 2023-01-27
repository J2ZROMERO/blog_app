class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def self.update_post_counter(id, newcounter)
    User.find(id).update(PostsCounter: newcounter)
  end

  def self.return5_recent_post(id)
    Comment.where(posts_id: id).last(5)
  end
end
