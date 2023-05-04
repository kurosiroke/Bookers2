class BooksController < ApplicationController
 before_action :correct_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @books = Book.all
    @image = Book.find(params[:id])
    @user = @book.user
  end


  def index
    @books = Book.all
    @user = current_user
    @book = Book.new

  end


  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book.id)
    else
    @books = Book.all
    @user = current_user
     render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

 def correct_user
   @book = Book.find(params[:id])
   @user = @book.user
    redirect_to(books_path) unless @user == current_user
 end
end