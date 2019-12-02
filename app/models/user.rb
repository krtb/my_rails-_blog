class User < ApplicationRecord
    validates :username, presence: true, length: { minumum: 3, maximum: 25 }
end