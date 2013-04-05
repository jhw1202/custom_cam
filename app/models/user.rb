class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/
  has_secure_password

  has_many :contests, :foreign_key => :creator_id
  has_many :photos

  attr_accessible :email, :password_digest, :photographer, :username, :password, :password_confirmation
  validates :email, presence: true
  validates :username, presence: true
  validates :password_digest, presence: true
  validates :email, :format => { with: VALID_EMAIL_REGEX }
  validates :password, :length => { minimum: 6 }
end
