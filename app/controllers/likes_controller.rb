class LikesController < ApplicationController

  def create
    @like = current_user.likes.create(book_id: params[:book_id])
    redirect_to root_path
  end

  def destroy
    @like = current_user.likes.find_by(book_id: @book.id)
    @like.destroy
    redirect_to root_path
  end

end
