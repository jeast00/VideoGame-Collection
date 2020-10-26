class User < ApplicationRecord
    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true

    has_many :genres
    has_many :games, through: :genres
    has_secure_password

    #scope method for session login omniauth
    def self.find_or_create_by_omniauth(auth_hash)
        self.where(:email => auth_hash['info']['email']).first_or_create do |user|
            user.password = SecureRandom.hex(16)
        end
    end
end
