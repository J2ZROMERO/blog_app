class AddPostToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :posts , references: :posts, null: false, foreign_key: {to_table: :posts}
  end
end
