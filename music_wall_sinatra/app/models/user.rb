class User < ActiveRecord::Base

  has_many :songs

  validates :username, presence: true
end
