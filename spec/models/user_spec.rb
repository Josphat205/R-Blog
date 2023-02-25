require 'rails_helper'
RSpec.describe User, type: :model do
  before(:all) do
    @user = User.new(
      name: 'Josphat',
      bio: 'Developer',
      photo: 'http://v1/pic.png',
      posts_counter: 0
    )
  end

  it 'user as created is valid' do
    expect(@user).to be_valid
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'posts_counter should be >= 0' do
    @user.posts_counter = -2
    expect(@user).to_not be_valid
  end

  it 'posts_counter should be numeric' do
    @user.posts_counter = 'One'
    expect(@user).to_not be_valid
  end
  it 'fetch recent posts' do
    @user.save
    @post = Post.create(
      title: 'A new Post',
      text: 'Web Developer',
      author_id: @user.id,
      comments_counter: 0,
      likes_counter: 0
    )
    expect(@user.fetch_recent_posts.count).to eq(1)
  end
end
