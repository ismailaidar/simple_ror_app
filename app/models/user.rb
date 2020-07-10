class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: {maximum: 20}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                        format: {with: VALID_EMAIL_REGEX}, 
                        length: { maximum: 255 },
                        uniqueness: true
    validates :password, presence: true, 
                        length: { minimum: 6 }
    has_secure_password
end
