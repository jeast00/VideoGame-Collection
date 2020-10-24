class User < ApplicationRecord
    has_many :genres
    has_many :games, through: :genres
    has_secure_password
end
