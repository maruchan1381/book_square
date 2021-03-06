class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books
  has_many :reviews
  has_many :likes
  has_many :liked_books, through: :likes, source: :book

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true
    validates :password, length: { minimum: 6 },
                         format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  end

  def already_liked?(book)
    self.likes.exists?(book_id: book.id)
  end
end
