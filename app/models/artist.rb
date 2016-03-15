class Artist < ActiveRecord::Base
  has_many :designs
  validates_uniqueness_of :email
  validates_presence_of :email
  validates_uniqueness_of :name
  validates_presence_of :name
end
