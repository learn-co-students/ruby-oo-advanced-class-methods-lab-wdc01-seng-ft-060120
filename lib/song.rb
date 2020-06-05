require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    binding.pry
  end

  def self.create
    song = self.new
    self.all << song
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    song = self.all.find do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)

    if song == nil
      return self.create_by_name(name)
    else
      return song
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name[0]
    end
  end

  def self.new_from_filename(name)
    punctuation = name.split('.')[0]
    name_and_artist_only = punctuation.split(' - ')

    song = self.new
    song.name = name_and_artist_only[1]
    song.artist_name = name_and_artist_only[0]
    song
  end

  def self.create_from_filename(name)
    self.all << self.new_from_filename(name)
  end

  def self.destroy_all
    self.all.clear

  end

end
