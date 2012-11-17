# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  photo      :string(255)
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
	has_many :songs
	belongs_to :artist

	validates :name, :photo, :presence => true
end
