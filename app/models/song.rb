# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  photo      :string(255)
#  album_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Song < ActiveRecord::Base
	has_and_belongs_to_many :albums
	has_and_belongs_to_many :artists
	has_and_belongs_to_many :genres

	validates :name, :photo, :presence => true
	validates :name, :uniqueness => true
	mount_uploader :photo, MusicUploader
	mount_uploader :mp3, Mp3Uploader
end

