class User < ActiveRecord::Base
    has_many :events, dependent: :destroy
    has_one :money, dependent: :destroy
    attr_accessor :password,:password_confirmation
end
