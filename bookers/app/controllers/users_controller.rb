class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def create
    @user = User.new(post_image_params)
    @user.user_id = current_user.id
    if @user.save
    flash[:success] = 'You have updated user successfully.'
    redirect_to user_path
    else
    @users = User.all
    render:edit
    end
  end

  def index
    @user = current_user
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render:edit
    else
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
      @user.update(user_params)
    if @user.save
      flash[:success] = 'User was successfully updated.'
     redirect_to user_path(current_user.id)
    else
     @users = User.find(params[:id])
     render :edit
    end
  end  
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end 
end
