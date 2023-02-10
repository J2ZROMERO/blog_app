require 'rails_helper'

RSpec.describe UserController, type: :request do
  before(:each) do
    @user = User.create!(id: 4, Name: 'Jose', PostsCounter: 4, email: 'juan@hotmail.com', password: '1234567')
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get root_path
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get root_path
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get root_path
      expect(response.body).to include('User Name')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get user_path(@user)
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get '/user/:id(215)'
      expect(response).to render_template(:show)
    end

    it 'includes the Bio word in the response body' do
      get user_path(@user)
      expect(response.body).to include('Bio')
    end
  end
end
