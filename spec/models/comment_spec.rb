# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.create(
      name: 'cosmo',
      photo: 'https://Cosmo.jpg',
      bio: 'Cosmo bio',
      posts_counter: 0
    )
    @post = Post.create(
      title: 'A new Post',
      text: 'Web Developer',
      author_id: @user.id,
      comments_counter: 0,
      likes_counter: 0
    )
  end

  it '@users comments_counter should increase by one' do
    @comment = Comment.create(text: 'Hello World!', author_id: @user.id, post_id: @post.id)
    @comment = Comment.create(text: 'Welcome World!!', author_id: @user.id, post_id: @post.id)
    expect(@comment.author_id).to_not eq(2)
  end
  it 'update_counter should increase comments_counter by one' do
    @comment = Comment.create(text: 'Hello World!', author_id: @user.id, post_id: @post.id)
    expect(@comment.update_counter.comments_counter).to eq(2)
  end
end
