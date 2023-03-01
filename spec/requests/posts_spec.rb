require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'James', posts_counter: 0, photo: '', bio: '')
      @post = Post.create(title: 'Title', text: 'Text', author_id: @user.id)
      get "/users/#{@user.id}/posts"
    end

    it('status should be :ok') do
      expect(response).to have_http_status(:ok)
    end

    it('should render :show template') do
      expect(response).to render_template(:index)
    end

    it 'body should includes correct placeholder text' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end
  describe 'GET /show' do
    before(:each) do
      @user = User.create(name: 'James', posts_counter: 0, photo: '', bio: '')
      @post = Post.create(title: 'Title', text: 'Text', author_id: @user.id)
      get "/users/#{@user.id}/posts/show"
    end
    it 'status should be :ok' do
      expect(response).to have_http_status(:ok)
    end
    it 'should render :show template' do
      expect(response).to render_template(:show)
    end
    it 'body should includes correct placeholder text' do
      expect(response.body).to include('Here is a single post')
    end
  end
end
