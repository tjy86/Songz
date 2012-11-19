class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end 

  def show
    artist_id = params[:id]
    @artist = Artist.find(artist_id)
  end

  def create
    @artist = Artist.new(params[:artist])    
    if @artist.save
        redirect_to artists_path
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      redirect_to @artist
    else
      render :edit
    end  
  end

  def destroy
    artist = Artist.find(params[:id])
    Artist.delete(artist)
    redirect_to artists_path
  end

  def add_all
    artist = Artist.find(params[:id])
    artist_name = artist["name"].gsub(" ","+")
    albums_return = HTTParty.get("http://ws.spotify.com/search/1/album.json?q=#{artist_name}")
    albums = albums_return["albums"]

    begin
      albums.each do |album|
        album_plus = album["name"].gsub(" ","+")
        album_return = HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=b7c58e8da5915f0fea3066e3f29f2362&artist=#{artist_name}&album=#{album_plus}&format=json")
        album_image = album_return["album"]["image"][3]["#text"]
        if album_image.empty?
          album_image = ""
        end
        artist.albums << Album.create(:name => album["name"], :remote_photo_url => album_image )
      end
    rescue
      
    end

    redirect_to artist
  end

end



