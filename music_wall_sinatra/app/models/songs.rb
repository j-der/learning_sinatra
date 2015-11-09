class Songs < ActiveRecord::Base
  validates :title, :artist, :author, presence: true
end
