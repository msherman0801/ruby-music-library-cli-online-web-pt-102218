require 'pry'
class Song 
  
  attr_accessor :name, :artist, :genre
  @@all = []
  
  def initialize(name, artist=nil, gen=nil)
    @name = name
    @genre = gen
    self.genre = gen if gen != nil
    artist.add_song(self) if artist != nil
    # if artist != nil && !artist.genres.include?(gen)
    #   artist.genres << gen 
    # end
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all 
    @@all.clear
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save 
    song
  end
  
  def self.find_by_name(param)
    @@all.any? {|i| 
      if param == i.name
        return i
      end
    }
  end
  
  def self.find_or_create_by_name(param)
    if self.find_by_name(param)
      self.find_by_name(param)
    else
      self.create(param)
    end
  end
  
  def self.new_from_filename(file)
    self.find_or_create_by_name(file.split(' - ')[1])
  end
  
  def save
    @@all << self
  end
  
  def genre=(param)
    @genre = param
    param.songs << self if !param.songs.include?(self)
  end
  
  def artist=(param)
    @artist = param
    param.add_song(self)
  end

end