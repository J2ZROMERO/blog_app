class Post < ApplicationRecord
    belongs_to :user, foreign_key: "author_id"
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    validates :Title, presence: false
    validates :Text, presence: false
    validates :CommentsCounter, presence: false
    validates :LikesCounter, presence: false
  end
  