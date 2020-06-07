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
    #Creates a song and adds it to @@all array
    song = self.new
    self.all << song
    return song 
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    return song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    return song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if !self.all.include?(self.find_by_name(song_name))
      self.create_by_name(song_name)
    else
      song = self.find_by_name(song_name)
      return song
    end
  end  
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename (filename)
    song = self.new
    song_data = filename.split(" - ")
    song.name = song_data[1].delete_suffix('.mp3')
    song.artist_name = song_data[0]
    return song
  end

  def self.create_from_filename (filename)
    song = self.create
    song_data = filename.split(" - ")
    song.name = song_data[1].delete_suffix('.mp3')
    song.artist_name = song_data[0]
    return song
  end

  def self.destroy_all
    self.all.clear
  end
end
