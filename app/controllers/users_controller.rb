# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at DESC')
  end

  def show
    @user_id = params[:id]
    @user = User.includes(posts: %i[author]).find(params[:id].to_i)
  end
end
