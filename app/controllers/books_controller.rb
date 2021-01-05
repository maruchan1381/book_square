class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def search
    if params[:keyword]
      @books = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
  end
end