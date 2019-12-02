class User < ApplicationRecord
    has_many :dogs
    has_many :comments
    has_many :parks, through: :comments
end
