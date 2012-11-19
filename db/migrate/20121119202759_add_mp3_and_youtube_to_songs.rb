class AddMp3AndYoutubeToSongs < ActiveRecord::Migration
  def change
  	add_column :songs, :mp3, :string
  	add_column :songs, :you_tube, :string

  	create_table :genre do |t|
  		t.string :name
  		t.timestamps
  	end

  	create_table :genres_songs, :id => false do |t|
  		t.integer :genre_id
  		t.integer :song_id
  	end

  	create_table :artists_songs, :id => false do |t|
  		t.integer :artist_id
  		t.integer :song_id
  	end

  	create_table :albums_songs, :id => false do |t|
  		t.integer :album_id
  		t.integer :song_id
  	end
  end
end
