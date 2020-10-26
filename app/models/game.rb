class Game < ApplicationRecord
    has_many :genres
    has_many :users, through: :genres

    validates :title, :platform, presence: true
    validates :title, :platform, uniqueness: true
end
