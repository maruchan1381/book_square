class AddReviewToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :review, null: false, foreign_key: true
  end
end
