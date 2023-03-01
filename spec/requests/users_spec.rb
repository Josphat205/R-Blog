require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    
    
    it('status should be :ok') do
      get "/users/index"
      expect(response).to have_http_status(:ok)
    end

    it('rendered :index template') do
      get "/users/index"
      expect(response).to render_template(:show)
    end
    it 'body should includes correct placeholder text' do
      get "/users/index"
      expect(response.body).to include('Here is a single user')
    end
    
  end
end
