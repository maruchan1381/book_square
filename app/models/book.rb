class Book < ApplicationRecord
  belongs_to :user
  has_one :reviews

  with_options presence: true do
    validates :title
    validates :image_url
    validates :author
  end
end
