class User < ActiveRecord::Base
    has_many :reports
    has_secure_password
    validates :username, :presence => true, :uniqueness => true
    validates :password, :presence => true #specify password requirements
end