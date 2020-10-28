class Game < ApplicationRecord
    belongs_to :user
    belongs_to :genre

    validates :title, :platform, presence: true
    validates :title, :platform, uniqueness: true

    def most_games_under_one_genre
        #scope method example
    end
end
