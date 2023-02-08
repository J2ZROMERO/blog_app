require 'database_cleaner'
require 'rails_helper'
require 'spec_helper'

RSpec.describe 'UsersController', type: :system do
  before(:each) do
    # Create users
    @user = User.create(Name: 'Carla', Photo: 'https://c.files.bbci.co.uk/48DD/production/_107435681_perro1.jpg', Bio:
    'Lorem ipsum dolor sit amet sss labore fugiat!.', PostsCounter: 0)
    @first_post = Post.create(author_id: @user.id, Title: 'The jungle', Text: 'Lorem ipsum fugiat!', LikesCounter: 5,
                              CommentsCounter: 0)
    @second_post = Post.create(author_id: @user.id, Title: 'The animals', Text: 'Lorem ipsum fugiat!',
                               LikesCounter: 1, CommentsCounter: 0)
    @third_post = Post.create(author_id: @user.id, Title: 'The food', Text: 'Lorem ipsum fugiat!', LikesCounter: 1,
                              CommentsCounter: 0)
    @first_comment = Comment.create(posts_id: @first_post.id, author_id: @user.id, Text: 'Hi Tom!')
    @second_comment = Comment.create(posts_id: @first_post.id, author_id: @user.id, Text: 'Hi Tom!')
  end

  describe 'index' do
    it 'I can see the profile picture for the user selected' do
      # navigate to the index page with the especific index.
      visit user_posts_path(user_id: @user.id)
      # assert that the profile picture is present.

      assert page.has_selector?("img[src='#{@user.Photo}']")
    end
  end

  describe 'index' do
    it 'shows the username' do
      # Visit the index user path
      visit user_posts_path(user_id: @user.id)
      # wait for the answer of the test
      assert page.has_content?(@user.Name)
    end
  end

  describe 'index' do
    it 'I can see the number of posts a user has written' do
      # navigate to the index page
      visit user_posts_path(user_id: @user.id)
      # assert that the number of post is present for each user.

      assert page.has_content?('Number of posts: 3')
    end
  end

  describe 'index' do
    it 'I can see the a posts title' do
      # Visit the index user path
      visit user_posts_path(user_id: @user.id)
      # wait for the answer of the test
      assert page.has_content?(@first_post.Title)
    end
  end

  describe 'index' do
    it 'I can see some of the text body' do
      # Visit the index user path
      visit user_posts_path(user_id: @user.id)
      post_body = find('.textPost_post_index_1').text
      # wait for the answer of the test
      expect(post_body).to have_content(@first_post.Text)
    end
  end

  describe 'index' do
    it 'I can see the first comments on a post.' do
      # Visit the index user path
      visit user_posts_path(user_id: @user.id)
      first_comment_post = find(".commentByUser_post_index_#{@first_comment.id}").text
      # wait for the answer of the test
      assert page.has_content?(first_comment_post)
    end
  end

  describe 'index' do
    it 'I can see how many comments on a post has.' do
      # Visit the index user path
      visit user_posts_path(user_id: @user.id)
      # wait for the answer of the test
      comment_count = all('.commentMessage_post_index').count
      expect(comment_count).to eq(2)
    end
  end

  describe 'index' do
    it 'I can see how many likes a post has.' do
      # Visit the index user post path
      visit user_posts_path(user_id: @user.id)

      # wait for the answer of the test
      expect(page).to have_content('Likes: 5')
    end
  end

  describe 'index' do
    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      visit user_posts_path(user_id: @user.id)
      # check that the user's  pagination is displayed
      expect(page).to have_button('Pagination')
    end
  end

  describe 'index' do
    it 'When I click on a post, it redirects me to that posts show page' do
      visit user_post_path(user_id: @user.id, id: @first_post.id)
      # check that the user's  post  is displayed on the show view
      assert page.has_content?("Post 1 By #{@user.Name}")
    end
  end
end
