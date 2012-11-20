class SongsController < ApplicationController
	def index
		@songs = Song.all
	end

	def show
		song_id = params[:id]
		@song = Song.find(song_id)
		# album_id= @song.album_id
		# @album = Album.find(album_id)
		# artist_id = @album.artist_id
		# @artist = Artist.find(artist_id)
		begin
			url = "http://lyrics.wikia.com/api.php?artist=#{@artist.name}&song=#{@song.name}&fmt=text".gsub(' ','%20')
			@lyric = HTTParty.get(url)
		rescue
		end
	end

	def new
		@song = Song.new
	end

	def edit
		@song = Song.find(params[:id])
	end

	def create
		@song = Song.new(params[:song])
		if @song.save
			redirect_to songs_path
		else
			render :new
		end

	end

	def update
		@song = Song.find(params[:id])

		if @song.update_attributes(params[:song])
			redirect_to @song
		else
			render :edit
		end
	end

	def destroy
		song = Song.find(params[:id])
		song.delete
		redirect_to songs_path
	end
end
