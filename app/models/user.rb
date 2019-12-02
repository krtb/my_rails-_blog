class User < ApplicationRecord
    validates :username, presence: true, 
    uniqueness: {case_sensitive: false}, #can't capitalize letters in name to create diff User
    length: { minumum: 3, maximum: 25 }
end