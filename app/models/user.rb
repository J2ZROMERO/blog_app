class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    validates :Name, presence: true
    validates :Photo, presence: true
    validates :Bio, presence: true
    validates :PostsCounter, presence: false
  end
  