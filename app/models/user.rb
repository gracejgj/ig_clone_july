class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar #1-to-1 mapping between records and files

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'following_id', dependent: :destroy

  has_many :followings, through: :active_relationships
  has_many :followers, through: :passive_relationships
end

#minutes 3.16 user.rb
#Attaching Files to Records
# has_many : post (a user has many post) dependent::destroy (a post belong to the current user is deleted)
# has_one_attacted - upload a picture for user (will added to the form fill)
