require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @first_user = User.new(id: 1, Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           Bio: 'Teacher from Mexico.', PostsCounter: 10)
    @first_user.save

    @subject = Post.new(id: 1, author_id: @first_user.id, Title: 'Hello',
                        Text: 'This is my first post', LikesCounter: 10, CommentsCounter: 20)
    @subject.save
    5.times do |i|
      subject = Post.new(author_id: @first_user.id, Title: 'Hello',
                         Text: 'This is my first post', LikesCounter: 10, CommentsCounter: 20)
      subject.save
      comment = Comment.new(posts_id: @subject.id, author_id: @first_user.id, Text: "Comment #{i}")
      comment.save
    end
  end

  describe 'When the user model is tested' do
    it 'validates presence of name' do
      user = User.new
      expect(user.valid?).to be false
      user.Name = 'John Doe'
      user.PostsCounter = 5
      expect(user.valid?).to be true
    end
  end

  describe 'When the user model is tested' do
    it 'The validation PostsCounter must be an integer greater than or equal to zero.' do
      user = User.new
      user.Name = 'John Doe'
      user.PostsCounter = -1
      expect(user.valid?).to be false # PostsCounter is less than 0
      user.PostsCounter = 5
      expect(user.valid?).to be true # name and PostsCounter are valid
    end
  end

  describe 'When te test user is executed' do
    it 'The method see_3recent_posts must be = 3' do
      expect(User.see_3recent_posts(1).length).to eq(3)
    end
  end
end
