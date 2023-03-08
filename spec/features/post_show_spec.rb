require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  describe 'show page' do
     before :each do
      @user = User.create(name: 'Tom',
                          bio: 'Teacher from Mexico.',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          posts_counter: 1)
      @user2 = User.create(name: 'Lilly',
                           bio: 'Teacher from Poland.',
                           photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           posts_counter: 0)
      @post = Post.create(title: 'Hello',
                          text: 'This is my first post',
                          comments_counter: 0,
                          likes_counter: 0,
                          author: @user)
    end

    it 'Should display the post title' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content(@post.title)
    end

    it 'Should display who wrote the post' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content(@user.name)
    end

    it 'Should display how many comments it has' do
      visit "/users/#{@user.id}/posts/#{@post.id}"

      expect(page).to have_content(@post.comments_counter)
    end

    it 'Should diplay how many likes it has' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content(@post.likes_counter)
    end

    it 'Should display the post body' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content(@post.text)
    end

    it 'Should display the username of each comment' do
      Comment.create(author: @user2, post: @post, text: 'Hi Tom!')
      @post.update(comments_counter: 1)
      @comments = Comment.where(post: @post.id)
      visit "/users/#{@user.id}/posts/#{@post.id}"
      @comments.each do |comment|
        expect(page).to have_content(comment.author.name)
      end
    end

    it 'Shuld display the comment of each username' do
      Comment.create(author: @user2, post: @post, text: 'Hi Tom!')
      @post.update(comments_counter: 1)
      @comments = Comment.where(post: @post.id)
      visit "/users/#{@user.id}/posts/#{@post.id}"
      @comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end
end
