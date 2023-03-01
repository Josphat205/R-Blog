require 'rails_helper'
RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it('status should be :ok') do
      get '/users/index'
      expect(response).to have_http_status(:ok)
    end

    it('rendered :index template') do
      get '/users'
      expect(response).to render_template(:index)
    end
    it 'body should includes correct placeholder text' do
      get '/users'
      expect(response.body).to include('Here is a list of users for a given user')
    end
  end

  describe 'GET /show' do
    it 'status should be :ok' do
      get '/users/show'
      expect(response).to have_http_status(:ok)
    end
    it 'should render :show template' do
      get '/users/show'
      expect(response).to render_template(:show)
    end
    it 'body should includes correct placeholder text' do
      get '/users/show'
      expect(response.body).to include('Here is a single user')
    end
  end
end
