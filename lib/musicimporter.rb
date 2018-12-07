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
    
  
end