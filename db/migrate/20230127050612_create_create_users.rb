class CreateCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :create_users do |t|
      t.string :Name
      t.string :Photo
      t.string :Bio
      t.string :PostsCounter
      t.string :git
      t.string :add
      t.string :.

      t.timestamps
    end
  end
end
