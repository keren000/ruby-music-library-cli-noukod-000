class Genre

  extend Concerns::Findable
  attr_reader :songs, :artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end


  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self if song.genre.nil?
  end

  def artists
    songs.collect{|song| song.artist}.uniq
  end
end
