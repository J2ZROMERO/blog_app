class AddPostToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :posts , references: :posts, null: false, foreign_key: {to_table: :posts}
  end
end
