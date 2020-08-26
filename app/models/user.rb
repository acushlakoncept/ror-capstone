class User < ApplicationRecord
    has_many :opinions

    validates_uniqueness_of :username, case_sensitive: false, message: 'Username already taken.'
    validates_presence_of :username, message: 'Username cannot be blank'
    validates_presence_of :fullname, message: 'FullName cannot be blank'
    validates :username, length: { minimum: 3, maximum: 10,
                                  too_long: 'Maximum allowed username is 10 characters.',
                                  too_short: 'Minimum allowed characters for username is 3' }
    validates :fullname, length: { minimum: 6, maximum: 20,
                                  too_long: 'Maximum allowed fullname is 20 characters.',
                                  too_short: 'Minimum allowed characters for fullname is 6'}  
     
    before_save { self.username.downcase!}
end