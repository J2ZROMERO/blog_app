require 'database_cleaner'
require 'rails_helper'
require 'spec_helper'



RSpec.describe 'UsersController', type: :system do
  before(:each) do
    # Create users
    @user = User.create(Name: 'Carla', Photo: 'https://c.files.bbci.co.uk/48DD/production/_107435681_perro1.jpg', Bio: 
    'Lorem ipsum dolor sit amet sss labore fugiat!.',PostsCounter: 0)
    @first_post = Post.create(author_id: @user.id, Title: 'Hello', Text:  'Lorem ipsum fugiat!', LikesCounter: 1, CommentsCounter: 0)
    @second_post = Post.create(author_id: @user.id, Title: 'Hello', Text:  'Lorem ipsum fugiat!', LikesCounter: 1, CommentsCounter: 0)
    @third_post = Post.create(author_id: @user.id, Title: 'Hello', Text:  'Lorem ipsum fugiat!', LikesCounter: 1, CommentsCounter: 0)
  end



  describe 'show' do
    it 'I can see the profile picture for the user selected' do
    # navigate to the index page with the especific index.
    visit user_path(:id => @user.id)
    # assert that the profile picture is present.
    
      assert page.has_selector?("img[src='#{@user.Photo}']")
    
    end 
  end



describe 'show' do
  it 'shows the username' do
    # Visit the index user path
    visit user_path(:id => @user.id)
    # wait for the answer of the test
      assert page.has_content?(@user.Name)
  end
end


describe 'show' do
  it 'I can see the number of posts a user has written' do
  # navigate to the index page
  visit root_path
  # assert that the number of post is present for each user.

    assert page.has_content?("Number of posts: 3")
  end 
end

describe 'show' do
    it 'I can see the users bio' do
      # Visit the index user path
      visit user_path(:id => @user.id)
      # wait for the answer of the test
        assert page.has_content?(@user.Bio )
    end
  end

  describe 'show' do
    it 'I can see the users first 3 posts' do
      # Visit the index user path
      visit user_path(:id => @user.id)
      # wait for the answer of the test
      assert page.has_content?("Post 1")
      assert page.has_content?("Post 2")
      assert page.has_content?("Post 3")
    end
  end


  describe 'show' do
    it 'I can see the button that lets me view all of a user\'s posts' do
      # Visit the index user path
      visit user_path(:id => @user.id)
      # wait for the answer of the test
      expect(page).to have_button('See all posts')
    end
  end

  describe 'show' do
    it 'When I click a users post, it redirects me to that posts show page.' do
      
      visit user_post_path(:user_id => @user.id, :id => @first_post.id)
       # check that the user's  post  is displayed on the show view
       assert page.has_content?("Post 1 By #{@user.Name}")
    end 
  end

  describe 'show' do
    it 'When I click to see all posts, it redirects me to the users posts index page.' do      
      visit user_posts_path(:user_id => @user.id)
       # check that the user's  post  is displayed on the show view
       assert page.has_content?("Post 1")
       assert page.has_content?("Post 2")
       assert page.has_content?("Post 3")
       expect(page).to have_button('Pagination')
    end 
  end




end