class Game < ApplicationRecord
    has_many :genres
    has_many :users, through: :genres
end
