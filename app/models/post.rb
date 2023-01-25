class Post < ApplicationRecord
    has_many :likes
    has_many :comments
    belongs_to :users
end
