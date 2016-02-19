class User < ActiveRecord::Base
  has_many :user_designs
  has_many :designs, :through => :user_designs
  validates_uniqueness_of :email
  validates_presence_of :email
  validates_uniqueness_of :name
  validates_presence_of :name
end
