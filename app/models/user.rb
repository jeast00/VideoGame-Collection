class User < ApplicationRecord
    validates :username, :email, :password, presence: true
    validates :username, :email, uniqueness: true

    has_many :genres
    has_many :games, through: :genres
    has_secure_password
end
