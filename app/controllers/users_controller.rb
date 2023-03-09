# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at DESC')
  end

  def show
    @user = User.includes(posts: %i[author]).find(current_user.id)
  end

  # def destroy 
  #   after_sign_out_path_for
  # end

end
