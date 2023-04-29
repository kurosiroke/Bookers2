class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
  end

  def index
    @users = User.all
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def create
    @user = User.new(user_params)
    @user.usre_id = current_user.id
    @user.save
    radirect_to user_path
    @book_new = Book.new
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
