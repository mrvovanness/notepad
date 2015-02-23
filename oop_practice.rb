class Note
  attr_reader :text, :shared
  attr_accessor :shared
  def initialize(text, shared = false)
    @text = text
    @shared = shared
  end

  def share
    @shared = true
  end
end

class Notebook
  attr_accessor :notes
  def initialize
    @notes = []
  end

  def clean
    @notes.clear
  end

  def add_note(*note)
    @notes.push(*note)
  end
end

class SharedNotebook < Notebook
  @@count = 0
  
  def initialize
    @notes = [] 
    @@count += 1
  end

  def self.count
    @@count
  end

  def add_note(*note)
    super
    @notes.map { |n| n.share }
  end
end
