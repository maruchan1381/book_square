class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  
  with_options presence: true do
    validates :description, length: { maximum: 30 }
    validates :date
  end

end