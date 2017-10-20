class User < ActiveRecord::Base
  has_secure_password
  has_many :organizations
  has_many :orgs_joined, through: :members, source: :organization 
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :password, presence: true 
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  before_validation do 
		self.email = email.downcase
	end

end
