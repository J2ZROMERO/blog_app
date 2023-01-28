require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @first_user = User.new(id:1,Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
    @first_user.save
    @subject = Post.new(id:1,author_id: @first_user.id, Title: 'Hello', Text: 'This is my first post', LikesCounter: 10 ,CommentsCounter: 20)
    @subject.save
    comment = Comment.new(posts_id: @subject.id, author_id: @first_user.id, Text: "Comment")
    comment.save
  end

  describe "When te test Comment is executed" do
    it "Comments counter must change from 0 to 20" do
      Comment.update_comments_counter(1,20)
      expect(Post.find_by(author_id: 1).CommentsCounter).to eq(20)
    end
  end
end
