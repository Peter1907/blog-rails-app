require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'Navigation to the users index page' do
    it 'should redirect to a page with a list of users' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'should render the correct view' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'should have the relevant text in the view' do
      get '/users'
      expect(response.body).to include('List of all users')
    end
  end

  context 'Navigation to the users show page' do
    it 'should redirect to a page with the user\'s id' do
      get '/users/7'
      expect(response).to have_http_status(200)
    end

    it 'should render the correct view' do
      get '/users/7'
      expect(response).to render_template(:show)
    end

    it 'should have the relevant text in the view' do
      get '/users/7'
      expect(response.body).to include('Info and Posts for User: 7')
    end
  end
end
