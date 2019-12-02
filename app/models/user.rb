class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true, length: { minumum: 3, maximum: 25 }
end