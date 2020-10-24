class User < ApplicationRecord
    has_many :genres
    has_many :games, through: :genres
end
