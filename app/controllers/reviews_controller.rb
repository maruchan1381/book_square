class ReviewsController < ApplicationController
  def create
    review = Review.create(review_params)
    redirect_to root_path
  end

  def show
    @book = Book.find(params[:book_id])
  end

  private
  def review_params
    params.require(:review).permit(:description, :date).merge(user_id: current_user.id, book_id: params[:book_id])
  end
end