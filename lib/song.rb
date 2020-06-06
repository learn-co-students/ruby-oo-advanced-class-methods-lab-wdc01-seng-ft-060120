class Song#======================================================
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  #---------------------------------------------
  def initialize(name = nil, artist = nil)
    self.name = name if name != nil
    self.artist_name = artist if artist != nil  
  end
  #make new song and push to all
  def self.create(name = nil, artist = nil)
    song = Song.new(name,artist)
    self.all << song
    return song
  end
  #make new song with name (NO PUSH)
  def self.new_by_name(name)
    return Song.new(name)
  end
  #creates a song by parsing filename for props
  #pushes to all
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
    return song
  end
  #creates a song by parsing filename for props
  #NO PUSH
  #form: "Taylor Swift - Blank Space.mp3"
  def self.new_from_filename(filename)
    array = filename.split(" - ")
    artist = array[0]
    name = array[1].split(".")[0]

    return Song.new(name,artist)
  end
  #make new song with name and push to all
  def self.create_by_name(name)
    self.create(name)
  end
  #find and return song by name
  #return falsey if not found
  def self.find_by_name(name)
    song = self.all.find{|my_song|my_song.name == name}
    if song != nil
      return song
    else
      return nil
    end
  end
  #returns song by given name
  #creates it if not found
  def self.find_or_create_by_name(name)
    my_song = self.find_by_name(name)
    if my_song == nil
      my_song = self.create_by_name(name)
    end
    return my_song
  end
  #returns @@all in alphabetical order
  def self.alphabetical
    return self.all.sort_by{|song| song.name}
  end
  def self.destroy_all
    self.all.clear
  end
  def save
    self.class.all << self
  end

end#+=============================================================
