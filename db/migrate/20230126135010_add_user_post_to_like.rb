class AddUserPostToLike < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :likes, :users, column: :AuthorId
    add_foreign_key :likes, :posts, column: :PostId
  end
end
