class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def search
    if params[:keyword]
      @books = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to root_path
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to root_path
  end
  
  private
  def book_params
    params.permit(:title, :author, :image_url).merge(user_id: current_user.id)
  end
end