require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @first_user = User.new(id: 1, Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           Bio: 'Teacher from Mexico.', PostsCounter: 10)
    @first_user.save
    @subject = Post.new(id: 1, author_id: @first_user.id, Title: 'Hello',
                        Text: 'This is my first post', LikesCounter: 10, CommentsCounter: 20)
    @subject.save
    5.times do |i|
      comment = Comment.new(posts_id: @subject.id, author_id: @first_user.id, Text: "Comment #{i}")
      comment.save
    end
  end

  describe 'When the post model is tested' do
    it 'validates presence of title' do
      post = Post.new
      expect(post.valid?).to be false
      post.author_id = 1
      post.Title = 'John Doe'
      post.CommentsCounter = 5
      post.LikesCounter = 4
      expect(post.valid?).to be true
    end
  end

  describe 'When the post model is tested' do
    it 'The validation  Title must be less than 250 characters' do
      post = Post.new
      expect(post.valid?).to be false
      post.author_id = 1
      post.Title = "John Doead John DoeadJohn DoeadJohn DoeadJohn DoeadJohn Doead
      John DoeadJohn DoeadJohn DoeadJohn DoeadJohn DoeadJohn DoeadJohn DoeadJohn Doead
      John DoeadJohn DoeadJohn DoeadJohn DoeadJohn DoeadJohn DoeadJohn DoeadJohn Doead
      John DoeadJohn DoeadJohn DoeadJohn DoeadJohn DoeadJohn Doead"
      post.CommentsCounter = 5
      post.LikesCounter = 4
      expect(post.valid?).to be false
    end
  end

  describe 'When the post model is tested' do
    it 'The validation  Comments counter must be Integer >= 0 ' do
      post = Post.new
      expect(post.valid?).to be false
      post.author_id = 1
      post.Title = 'John'
      post.CommentsCounter = -5
      post.LikesCounter = 4
      expect(post.valid?).to be false
    end
  end

  describe 'When the post model is tested' do
    it 'The validation Likes Counter must be Integer >= 0 ' do
      post = Post.new
      expect(post.valid?).to be false
      post.author_id = 1
      post.Title = 'John'
      post.CommentsCounter = 2
      post.LikesCounter = -1
      expect(post.valid?).to be false
    end
  end

  describe 'When te test Post is executed' do
    it ' The method Must return 5 recents posts' do
      expect(Post.return5_recent_post(1).count).to eq(5)
    end
  end

  describe 'When te test Post is executed' do
    it 'The method Must Update the Postscounter frmo 0 to 10' do
      Post.update_post_counter(1, 10)
      expect(User.find_by(id: 1).PostsCounter).to eq(10)
    end
  end
end
