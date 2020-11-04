class Genre < ApplicationRecord
    has_many :games
    has_many :users, through: :games

    validates :genre_type, presence: true
    validates :genre_type, uniqueness: true

    def self.genre_with_most_games
        self.joins(:games).group('games.id').order('count(games.id) desc limit 1')
    end
end
