class User < ApplicationRecord
  has_secure_password
  
  # Username validations
  validates :username, presence: true, 
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 },
                       format: { with: /\A[a-zA-Z0-9_]+\z/, message: "only allows letters, numbers, and underscores" }

  # Email validations
  validates :email, presence: true, 
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  # Password validations (using built-in has_secure_password validation)
  validates :password, presence: true, length: { minimum: 6 }
end
