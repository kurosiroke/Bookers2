class UsersController < ApplicationController
   before_action :correct_user, only: [:edit, :update]

  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @user = current_user
    @users = User.all
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.usre_id = current_user.id
    if @user.save
      radirect_to user_path
    else
      render :new
    end
    @book_new = Book.new
    flash[:notice] = "Welcome! You have signed up successfully."
    redirect_to user_path(@user.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def login
    flash[:notice] = "Signed in successfully."
  end

  def destroy
    @user = User.find(params[:id])
    user.destroy
    flash[:notice] = "Signed out successfully."
    redirect_to '/users'
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end