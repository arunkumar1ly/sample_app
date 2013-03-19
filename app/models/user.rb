# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password # Method-adding this one method to our model gives us a secure way to create and authenticate new users
  has_many :microposts, dependent: :destroy
  #before_save { self.email.downcase! }
  before_save {|user| user.email = email.downcase}
  before_save :create_remember_token
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships # since, in the case of a :followers attribute, Rails will singularize “followers” and automatically look for the foreign key follower_id in this case. I’ve kept the :source key to emphasize the parallel structure with the has_many :followed_users association, but you are free to leave it off. 
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true
  
  def feed
    # This is preliminary. See "Following users" for the full implementation.
    # Micropost.where("user_id = ?", id) # user_id equal to the current user’s id
    Micropost.from_users_followed_by(self)
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id) # Note that we have omitted the user itself.It is just equal to user.relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  private
  
   	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64 # Because of the way Active Record synthesizes attributes based on database columns, without self the assignment would create a local variable called remember_token, which isn’t what we want at all. Using self ensures that assignment sets the user’s remember_token so that it will be written to the database along with the other attributes when the user is saved.
    end 

end