class User < ApplicationRecord
    validates :username, presence: true, length: { minimum: 3, maximum: 10 }
    validates :fullname, presence: true, length: { minimum: 3, maximum: 20 }
end
