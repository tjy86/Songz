class AlbumsController < ApplicationController
	def index
		@albums = Album.all
	end

	def show
		album_id = params[:id]
		@album = Album.find(album_id)
		if @album.songs[0]
			@album_artist = @album.songs[0].artists[0]
		end
	end

	def new
		@album = Album.new
	end

	def edit
		@album = Album.find(params[:id])
	end

	def create
		@album = Album.new(params[:album])
		if @album.save
			redirect_to albums_path
		else
			render :new
		end

	end

	def update
		@album = Album.find(params[:id])

		if @album.update_attributes(params[:album])
			redirect_to @album
		else
			render :edit
		end
	end

	def destroy
		album = Album.find(params[:id])
		album.delete
		redirect_to albums_path
	end

	def add_all
	    album = Album.find(params[:id])
	    album_name = album["name"].gsub(" ", "+")
	    artist = Artist.find(album["artist_id"])
	    artist_name = artist["name"].gsub(" ","+")
	    album_return = HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=b7c58e8da5915f0fea3066e3f29f2362&artist=#{artist_name}&album=#{album_name}&format=json")
	    album_image = album_return["album"]["image"][3]["#text"]
	    tracks = album_return["album"]["tracks"]["track"]

	    begin
	      tracks.each do |track|
	        album.songs << Song.create(:name => track["name"], :remote_photo_url => album_image)
	      end
	    rescue
	    end

	    redirect_to album
  	end
end











