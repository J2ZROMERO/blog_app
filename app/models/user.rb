class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    validates :Name, presence: true
    validates :Photo, presence: true
    validates :Bio, presence: true
    validates :PostsCounter, presence: false

def self.see_3recent_posts(id)
    Post.where(author_id: id).last(3)    
end

end
  