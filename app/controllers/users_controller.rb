class UsersController < ApplicationController
    before_action :find_user, only: %i[show edit destroy]
    def index
      @users = User.all.order('created_at DESC')
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to user_path
      else
        redirect_to root_path
      end
    end
  
    def show
      @post = Post.new
      @posts = @user.posts
    end
  
    def edit; end
  
    def update; end
  
    def destroy; end
  
    private
  
    def find_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:name, :photo, :bio)
    end
  end
