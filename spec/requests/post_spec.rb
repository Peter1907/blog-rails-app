require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'Navigation to posts of a certain user' do
    it 'should have the relevant text in the view' do
      get '/users/7/posts/8'
      expect(response.body).to include('Post 8 for user 7')
    end

    it 'should render the correct view' do
      get '/users/7/posts'
      expect(response).to render_template(:index)
    end

    it 'should have the relevant text in the view' do
      get '/users/7/posts'
      expect(response.body).to include('All posts for user 7')
    end
  end

  context 'Navigation to a specific post for a specific user' do
    it 'should redirect to the correct page' do
      get '/users/7/posts/8'
      expect(response).to have_http_status(200)
    end

    it 'should render the correct view' do
      get '/users/7/posts/8'
      expect(response).to render_template(:show)
    end

    it 'should have the relevant text in the view' do
      get '/users/7/posts/8'
      expect(response.body).to include('Post 8 for user 7')
    end
  end
end
