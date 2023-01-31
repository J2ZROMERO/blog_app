require 'rails_helper'

RSpec.describe PostController, type: :request do
  before(:each) do
    @user = User.create!(id: 4, Name: 'Jose', PostsCounter: 4)
    @post = Post.create!(id: 4, author_id: @user.id, Title: 'There is something', CommentsCounter: 4, LikesCounter: 5)
    @route = '/user/:user_id/post'
  end

  describe 'GET #post' do
    it 'returns a successful response' do
      get @route
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get '/user/:user_id/post/'
      expect(response).to render_template('index')
    end

    it 'includes correct placeholder text in the response body' do
      get @route
      expect(response.body).to include('Number of posts: x')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get '/user/:user_id/post/:id'
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get '/user/:user_id/post/:id/'
      expect(response).to render_template('show')
    end

    it 'includes the --Comment 1-- word in the response body' do
      get '/user/:user_id/post/:id/'
      expect(response.body).to include('Comment 1')
    end
  end
end
