class Game < ApplicationRecord
    belongs_to :user
    belongs_to :genre

    validates :title, :platform, presence: true

    default_scope { order(:title) }

end
