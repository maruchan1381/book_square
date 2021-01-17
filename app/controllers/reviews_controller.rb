class ReviewsController < ApplicationController
  def create
    review = Review.create(review_params)
    redirect_to "/books/#{review.book.id}"
  end

  private
  def review_params
    params.require(:review).permit(:description, :date).merge(user_id: current_user.id, book_id: params[:book_id])
  end
end