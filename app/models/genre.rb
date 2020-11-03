class Genre < ApplicationRecord
    has_many :games
    has_many :users, through: :games

    validates :genre_type, presence: true
end
