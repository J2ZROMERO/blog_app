require 'database_cleaner'
require 'rails_helper'
require 'spec_helper'



RSpec.describe 'UsersController', type: :system do
  before(:each) do
    # Create users

    @users = []
    @users << User.create(Name: 'Carla', Photo: 'https://c.files.bbci.co.uk/48DD/production/_107435681_perro1.jpg',
                          Bio: 'Lorem ipsum dolor sit amet
    labore fugiat!.', PostsCounter: 0)
    @users << User.create(Name: 'Luis', Photo: 'https://c.files.bbci.co.uk/48DD/production/_107435681_perro1.jpg',
                          Bio: 'Lorem ipsum dolor sit amet
    labore fugiat!.', PostsCounter: 0)
    @users << User.create(Name: 'Juan', Photo: 'https://c.files.bbci.co.uk/48DD/production/_107435681_perro1.jpg',
                          Bio: 'Lorem ipsum dolor sit amet
    labore fugiat!.', PostsCounter: 0)
  end

  describe 'index' do
    it 'shows the username of all users' do
      # Visit the index user path
      visit root_path

      # wait for the answer of the tests
      @users.each do |user|
        assert page.has_content?(user.Name)
      end
    end
  end


  describe 'index' do
    it 'I can see the profile picture for each user' do
      # navigate to the index page
      visit root_path
      # assert that the profile picture is present for each use
      @users.each do |user|
        assert page.has_selector?("img[src='#{user.Photo}']")
      end
    end
  end

  describe 'index' do
    it 'I can see the number of posts each user has written' do
      # navigate to the index page
      visit root_path
      # assert that the number of post is present for each user.
      @users.each do |user|
        assert page.has_content?("Number of posts: #{user.PostsCounter}")
      end
    end
  end


  describe 'index' do
    it 'When I click on a user, I am redirected to that users show page' do
      visit user_path(id: @users.first.id)
      # check that the user's name is displayed on the show view
      expect(page).to have_content @users.first.Name
    end
  end
end
