require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title
    song.save
    song
  end

  def self.find_by_name(title)
    self.all.find {|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title) == nil
      self.create_by_name(title)
    else
      self.find_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename.delete_suffix!(".mp3")
    song = self.new
    song.name = filename.split(" - ")[1]
    song.artist_name = filename.split(" - ")[0]
    song
  end

  def self.create_from_filename(filename)
    filename.delete_suffix!(".mp3")
    song = self.new
    song.name = filename.split(" - ")[1]
    song.artist_name = filename.split(" - ")[0]
    song.save
  end

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
