require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    #binding.pry
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    Song.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(name)
    song = name.split(" - ")
    artist_name = song[0]
    song_name = song[1]
    song_name = song[1].gsub(".mp3","")
    #binding.pry
    song = self.new
    song.name = song_name 
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(name)
    song = name.split(" - ")
    artist_name = song[0]
    song_name = song[1].gsub(".mp3","")

    song = self.create
    song.name = song_name 
    song.artist_name = artist_name
    song
    #binding.pry
  end

  def self.destroy_all
    self.all.clear
  end  
end
