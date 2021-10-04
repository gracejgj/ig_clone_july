class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User' #refer to user models
  belongs_to :following, class_name: 'User'

  validates :follower_id, presence: true  #validate data, field must not be empty. Refer to
  validates :following_id, presence: true
end
