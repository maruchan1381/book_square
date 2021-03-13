class Book < ApplicationRecord
  belongs_to :user
  has_one :review, dependent: :destroy
  has_many :likes

  with_options presence: true do
    validates :title
    validates :image_url
    validates :author
  end
end
