class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  
  with_options presence: true do
    validates :description
    validates :date
  end

end
