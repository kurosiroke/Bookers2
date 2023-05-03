class UsersController < ApplicationController

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

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
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
end
