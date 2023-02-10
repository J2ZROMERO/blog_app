class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :email, presence: true, uniqueness: true
  validates :Name, presence: true
  validates :PostsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.see_3recent_posts(id)
    Post.includes(:user).where(author_id: id).last(3)
  end
end
