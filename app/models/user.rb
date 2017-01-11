class User < ActiveRecord::Base
  has_many :article
  validates :username, presence: true, uniqueness: {case_sensitive: false}, 
      length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false}, 
      format: { with: VALID_EMAIL_REGEX }
end
