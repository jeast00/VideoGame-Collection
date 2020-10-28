class Game < ApplicationRecord
    belongs_to :user
    belongs_to :genre

    validates :title, :platform, presence: true
    validates :title, :platform, uniqueness: true
end
