require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @first_user = User.new(id: 1, Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           Bio: 'Teacher from Mexico.',PostsCounter: 10)
    @first_user.save
    @subject = Post.new(id: 1, author_id: @first_user.id, Title: 'Hello', Text: 'This is my first post',
                        LikesCounter: 10, CommentsCounter: 20)
    @subject.save
    comment = Comment.new(posts_id: @subject.id, author_id: @first_user.id, Text: 'Comment')
    comment.save
  end


  describe 'When the like model is tested' do
    it "validates presence of the author and post foreign key" do
      comment = Comment.new
      expect(comment.valid?).to be false
      comment.author_id = 1
      comment.posts_id = 1
      expect(comment.valid?).to be true
    end
  end



  describe 'When te test Comment is executed' do
    it 'The method Comments counter must change from 0 to 20' do
      Comment.update_comments_counter(1, 20)
      val = Post.find_by(author_id: 1)
      comments = val.CommentsCounter
      expect(comments).to eq(20)
    end
  end
end
