class User < ActiveRecord::Base
	has_many :shouts

	has_many :followed_user_relationships,
		foreign_key: :follower_id,
		class_name: 'FollowingRelationship'
	has_many :followed_users, through: :followed_user_relationships

	has_many :follower_relationships,
		foreign_key: :followed_user_id,
		class_name: 'FollowingRelationship'
	has_many :followers, through: :follower_relationships

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def following? other_user
  	self.followed_users.include? other_user
  end

  def unfollow! other_user
  	self.followed_user_relationships.find_by(followed_user_id: other_user.id).destroy
  end
end
