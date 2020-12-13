class User < ActiveRecord::Base
    validates_presence_of :name, :email, :password
    has_secure_password
    validates :email, :uniqueness => true
    validates :name, :uniqueness => true
    has_many :run
end