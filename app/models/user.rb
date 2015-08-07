class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true, email_format: { message: 'has invalid format' }

  validates :name, presence: true, length: { minimum:4 }
end
