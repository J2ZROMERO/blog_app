require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @first_user = User.new(id: 1, Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           Bio: 'Teacher from Mexico.', PostsCounter: 10)
    @first_user.save
    @subject = Post.new(id: 1, author_id: @first_user.id, Title: 'Hello', Text: 'This is my first post',
                        LikesCounter: 10, CommentsCounter: 20)
    @subject.save
  end

  describe 'When the like model is tested' do
    it 'validates presence of the author and post foreign key' do
      like = Like.new
      expect(like.valid?).to be false
      like.author_id = 1
      like.posts_id = 1
      expect(like.valid?).to be true
    end
  end

  describe 'When te test Like is executed' do
    it 'The validation Likes counter must change from 0 to 20' do
      Like.update_likes_counter(1, 20)
      expect(Post.find_by(author_id: 1).LikesCounter).to eq(20)
    end
  end
end
