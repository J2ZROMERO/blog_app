class Comment < ApplicationRecord
  belongs_to :user, foreign_key: "users"
  belongs_to :posts
end
