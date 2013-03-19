# == Schema Information
#
# Table name: microposts
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Micropost < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user

  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  default_scope order: 'microposts.created_at DESC'

  # the below method returns microposts from the users being followed by the given user.
  def self.from_users_followed_by(user)
    #followed_user_ids = user.followed_user_ids
    followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id" # I have replace the above line of code into this code
    # where("user_id IN (?) OR user_id = ?", followed_user_ids, user)
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id) # I have replace the above line of code into this code(The question mark syntax is fine, but when we want the same variable inserted in more than one place, the second syntax is more convenient.)
  end

end