class Design < ActiveRecord::Base
  belongs_to :artist
  has_many :user_designs
  has_many :users, through: :user_designs
end
