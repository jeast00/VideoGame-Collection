class Genre < ApplicationRecord
    belongs_to :user
    belongs_to :game

    validates :genre_type, presence: true
    validates :genre_type, uniqueness: true
end
