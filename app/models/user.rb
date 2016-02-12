class User < ActiveRecord::Base
  has_many :user_designs
  has_many :designs, :through => :user_designs
end
