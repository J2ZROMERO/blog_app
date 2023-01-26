class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :AuthorId
      t.string :Title
      t.text :Text
      t.timestamps
      t.integer :CommentsCounter
      t.integer :LikesCounter

    end
    add_index :posts, :AuthorId
  end
end
