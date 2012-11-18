artist1 = Artist.create(:name => 'Radiohead', :remote_photo_url => 'http://images.jambase.com/merch/Radiohead%20-%20Best%20Of.jpg')

albums_return = HTTParty.get("http://ws.spotify.com/search/1/album.json?q=radiohead")
albums = albums_return["albums"]

albums.each do |album|
	album_plus = album["name"].gsub(" ","+")
	album_return = HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=b7c58e8da5915f0fea3066e3f29f2362&artist=radiohead&album=#{album_plus}&format=json")
	album_image = album_return["album"]["image"][3]["#text"]
	if album_image.empty?
		album_image = "http://images.jambase.com/merch/Radiohead%20-%20Best%20Of.jpg"
	end
	album1 = Album.create(:name => album["name"], :remote_photo_url => album_image )
	tracks = album_return["album"]["tracks"]["track"]

	tracks.each do |track|
		album1.songs << Song.create(:name => track["name"], :remote_photo_url => album_image)
	end

	artist1.albums << album1
end