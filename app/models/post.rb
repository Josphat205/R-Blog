class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  after_save :update_posts_counter

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def fetch_recent_comments
    comments.order('created_at DESC').last(5)
  end
end
