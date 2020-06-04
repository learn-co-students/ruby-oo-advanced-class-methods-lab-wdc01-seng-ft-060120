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
    song = self.new
    song.save

    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name

    return song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name

    return song
  end

  def self.find_by_name(name)
    return self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song)
      self.find_by_name(song)
    else
      self.create_by_name(song)
    end
  end

  def self.alphabetical
    return self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
  song_split = filename.split(" - ")
    artist = song_split[0]
    song_name = song_split[1].gsub(".mp3","")

    song = self.find_or_create_by_name(song_name)
    song.artist_name = artist

    return song
  end

  def self.create_from_filename(filename)
    song_split = filename.split(" - ")
    artist = song_split[0]
    song_name = song_split[1].gsub(".mp3","")

    song = self.find_or_create_by_name(song_name)
    song.artist_name = artist

    return song
  end

  def self.destroy_all
    self.all.clear
  end

end
