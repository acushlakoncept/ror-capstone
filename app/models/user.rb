class User < ApplicationRecord
    validates_uniqueness_of :username, message: 'Username already taken'
    validates :username, presence: true, length: { minimum: 3, maximum: 10,
                                                   too_long: 'Maximum allowed username is 10 characters.',
                                                   too_short: 'Minimum allowed characters for username is 3' }
    validates :fullname, presence: true, length: { minimum: 6, maximum: 20,
                                                   too_long: 'Maximum allowed fullname is 20 characters.',
                                                   too_short: 'Minimum allowed characters for fullname is 6'}                                             
end
