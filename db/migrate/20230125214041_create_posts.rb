class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :AuthorId
      t.string :Title
      t.string :Text
      t.string :CommentsCounter
      t.string :LikesCounter

      t.timestamps
    end
    add_index :posts, :AuthorId
  end
end
