class Game < ApplicationRecord
    belongs_to :user
    belongs_to :genre

    default_scope { order('title') }

    validates :title, :platform, presence: true


end
