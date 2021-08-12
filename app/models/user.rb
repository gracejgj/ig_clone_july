class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar #1-to-1 mapping between records and files

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end

#minutes 3.16 user.rb
#Attaching Files to Records
# has_many : post (a user has many post) dependent::destroy (a post belong to the current user is deleted)
# has_one_attacted - upload a picture for user (will added to the form fill)
