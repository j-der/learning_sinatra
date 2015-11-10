class Songs < ActiveRecord::Base

  belongs_to :user

  validates :title, :artist, :author, presence: true
end


# rename this to singular Song and find all places where the CLASS song shows up. table should be songSSSS
