class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :AuthorId
      t.integer :PostId
      t.string :Text

      t.timestamps
    end
    add_index :comments, :AuthorId
    add_index :comments, :PostId
  end
end
