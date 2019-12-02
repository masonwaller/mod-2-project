class User < ApplicationRecord
    has_many :dogs
    has_many :comments
    has_many :parks, through: :comments

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end
