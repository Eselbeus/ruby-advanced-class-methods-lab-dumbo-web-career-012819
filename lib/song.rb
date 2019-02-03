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
    @song = self.new
    @name = @song.name
    @@all << @song
    @song
  end
  
  def self.create_by_name(name)
    @song = self.new
    @song.name = name
    @@all << @song
    @song
  end
  
  def self.new_by_name(name)
    @song = Song.create
    @name = name
    @song.name = name
    @@all << @song
    @song
  end
  
  def self.find_by_name(name)
    Song.all.find do |tune|
      tune.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    if_exists = Song.all.find do |tune|
      tune.name == name
    end
    if if_exists
      return if_exists
    else 
      Song.create_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort
  end
  
  def self.destroy_all 
    @@all.clear
  end

end
