class User < ApplicationRecord

  has_many :posts, dependent :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :posts
  has_many :likes

  validates :nickname, presence: true, length: { maximum: 50 }
end
