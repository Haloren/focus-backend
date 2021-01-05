class User < ApplicationRecord
    has_secure_password
    
    has_many :todos, dependent: :destroy
    has_many :events, dependent: :destroy

    has_one :weather, dependent: :destroy

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end
