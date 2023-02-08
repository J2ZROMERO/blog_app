require 'database_cleaner'
require 'rails_helper'
require 'spec_helper'

RSpec.describe 'UsersController', type: :system do
  before(:each) do
    # Create users
    @user = User.create(Name: 'Carla', Photo: 'https://c.files.bbci.co.uk/48DD/production/_107435681_perro1.jpg', Bio:
    'Lorem ipsum dolor sit amet sss labore fugiat!.', PostsCounter: 0)
    @user2 = User.create(Name: 'Luis', Photo: 'https://c.files.bbci.co.uk/48DD/production/_107435681_perro1.jpg', Bio:
    'Lorem ipsum dolor sit amet sss labore fugiat!.', PostsCounter: 0)
    @user3 = User.create(Name: 'Petra', Photo: 'https://c.files.bbci.co.uk/48DD/production/_107435681_perro1.jpg', Bio:
    'Lorem ipsum dolor sit amet sss labore fugiat!.', PostsCounter: 0)
    @first_post = Post.create(author_id: @user.id, Title: 'The jungle', Text: 'Lorem ipsum fugiat!', LikesCounter: 5,
                              CommentsCounter: 0)
    @second_post = Post.create(author_id: @user.id, Title: 'The animals', Text: 'Lorem ipsum fugiat!',
                               LikesCounter: 1, CommentsCounter: 0)
    @third_post = Post.create(author_id: @user.id, Title: 'The food', Text: 'Lorem ipsum fugiat!', LikesCounter: 1,
                              CommentsCounter: 0)
    @first_comment = Comment.create(posts_id: @first_post.id, author_id: @user2.id, Text: 'Hi Tom!')
    @second_comment = Comment.create(posts_id: @first_post.id, author_id: @user3.id, Text: 'Hi great content!')
  end

  describe 'show' do
    it 'I can see the posts title' do
      visit user_post_path(user_id: @user.id, id: @first_post.id)
      assert page.has_content?(@first_post.Title)
    end
  end

  describe 'show' do
    it 'I can see who wrote the post' do
      visit user_post_path(user_id: @user.id, id: @first_post.id)
      assert page.has_content?("Post 1 By #{@user.Name}")
    end
  end

  describe 'show' do
    it 'I can see how many comments it has' do
      visit user_post_path(user_id: @user.id, id: @first_post.id)
      comment_count = all('.userComment_post_show').count
      expect(comment_count).to eq(2)
    end
  end

  describe 'show' do
    it 'I can see how many Likes it has' do
      visit user_post_path(user_id: @user.id, id: @first_post.id)
      likes = find('.comLikesPost_post_show')
      expect(likes).to have_content('Likes: 5')
    end
  end

  describe 'show' do
    it 'I can see the post body' do
      visit user_post_path(user_id: @user.id, id: @first_post.id)
      post_body = find('.textPost_post_show_1').text
      expect(post_body).to have_content(@first_post.Text)
    end
  end

  describe 'show' do
    it 'I can see the user name of each commentor' do
      visit user_post_path(user_id: @user.id, id: @first_post.id)
      expect(page).to have_content(@user2.Name)
      expect(page).to have_content(@user3.Name)
    end
  end

  describe 'show' do
    it 'I can see the comment of each commentor left' do
      visit user_post_path(user_id: @user.id, id: @first_post.id)
      user1 = find('.commentByUser_post_show_1')
      user2 = find('.commentByUser_post_show_2')
      expect(user1).to have_content('Hi Tom!')
      expect(user2).to have_content('Hi great content!')
    end
  end
  
end
