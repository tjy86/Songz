class AddAllTables < ActiveRecord::Migration
  def change
  	create_table :songs do |t|
  		t.string :name
  		t.string :photo
  		t.integer :album_id
  		t.timestamps
  	end

  	create_table :albums do |t|
  		t.string :name
  		t.string :photo
  		t.integer :artist_id
  		t.timestamps
  	end

  	create_table :artists do |t|
  		t.string :name
  		t.string :photo
  		t.timestamps
  	end


  end
end
