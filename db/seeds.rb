Artist.delete_all
Album.delete_all
Song.delete_all

artist1 = Artist.create(:name => 'Brothers Past', :photo => 'http://farm8.staticflickr.com/7008/6696397777_03bbd7f539.jpg')
artist2 = Artist.create(:name => 'The War on Drugs', :photo => 'http://farm8.staticflickr.com/7143/6502216875_053b8b9e9f.jpg')
artist3 = Artist.create(:name => 'Dodos', :photo =>  'http://farm6.staticflickr.com/5212/5535576288_76a4aeeee1.jpg')

song1 = Song.create(:name => "Song Name 1", :photo => 'http://farm8.staticflickr.com/7008/6696397777_03bbd7f539.jpg')
song2 = Song.create(:name => "Song Name 2", :photo => 'http://farm8.staticflickr.com/7008/6696397777_03bbd7f539.jpg')
song3 = Song.create(:name => "Song Name 3", :photo => 'http://farm8.staticflickr.com/7008/6696397777_03bbd7f539.jpg')
song4 = Song.create(:name => "Song Name 4", :photo => 'http://farm8.staticflickr.com/7008/6696397777_03bbd7f539.jpg')
song5 = Song.create(:name => "Song Name 5", :photo => 'http://farm8.staticflickr.com/7008/6696397777_03bbd7f539.jpg')
song6 = Song.create(:name => "Song Name 6", :photo => 'http://farm8.staticflickr.com/7008/6696397777_03bbd7f539.jpg')
song7 = Song.create(:name => "Song Name 7", :photo => 'http://farm8.staticflickr.com/7008/6696397777_03bbd7f539.jpg')
song8 = Song.create(:name => "Song Name 8", :photo => 'http://farm8.staticflickr.com/7008/6696397777_03bbd7f539.jpg')
song9 = Song.create(:name => "Song Name 9", :photo => 'http://farm8.staticflickr.com/7008/6696397777_03bbd7f539.jpg')
song10 = Song.create(:name => "Song Name 10", :photo => 'http://farm8.staticflickr.com/7008/6696397777_03bbd7f539.jpg')

album1 = Album.create(:name => "Yellow", :photo => 'http://farm8.staticflickr.com/7008/6696397777_03bbd7f539.jpg')
album2 = Album.create(:name => "Blue", :photo => 'http://farm8.staticflickr.com/7008/6696397777_03bbd7f539.jpg')
album3 = Album.create(:name => "Green", :photo => 'http://farm8.staticflickr.com/7008/6696397777_03bbd7f539.jpg')
album4 = Album.create(:name => "Red", :photo => 'http://farm8.staticflickr.com/7008/6696397777_03bbd7f539.jpg')
album5 = Album.create(:name => "Orange", :photo => 'http://farm8.staticflickr.com/7008/6696397777_03bbd7f539.jpg')

album1.songs = [song1, song2, song3]
album2.songs = [song4, song5, song6]
album3.songs = [song7, song8]
album4.songs = [song9]
album5.songs = [song10]

artist1.albums = [album1, album2]
artist2.albums = [album3, album4]
artist3.albums = [album5]