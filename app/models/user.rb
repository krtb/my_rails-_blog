class User < ApplicationRecord
    validates :username, presence: true, 
    uniqueness: {case_sensitive: false},
    length: { minumum: 3, maximum: 25 }

    validates :email, presence: true
end