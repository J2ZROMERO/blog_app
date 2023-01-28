class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  def self.update_post_counter(ide, newcounter)
    User.find_by(id: ide).update(PostsCounter: newcounter)
  end

  def self.return5_recent_post(id)
    Comment.where(posts_id: id).last(5)
  end
end
