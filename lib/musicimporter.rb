require 'pry'
class MusicImporter 
  
  attr_accessor :path
  @@files = []
  
  def initialize(filepath)
    @path = filepath
  end
  
  def files
    out = Dir.entries(@path).collect {|i| 
      if i.split('').last(4).join() == '.mp3'
        @@files << i
      else 
        false
      end
    }
    @@files.uniq
  end
  
  def import 
    files.each do |i|
      Song.create_from_filename(i)
    end
  end
    
  
end