class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :Title, length: { maximum: 250 }, presence: true
  validates :CommentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.update_post_counter(ide, newcounter)
    User.find_by(id: ide).update(PostsCounter: newcounter)
  end

  def self.return5_recent_post(id)
    Comment.where(posts_id: id).last(5)
  end
end
