class AddUserPostToComment < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :comments, :users, column: :AuthorId
    add_foreign_key :comments, :posts, column: :PostId
  end
end
