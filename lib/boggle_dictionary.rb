class BoggleDictionary
  include Singleton

  DEFAULT_DICTIONARY_PATH = "#{Rails.root}/lib/data/dictionary.txt"

  attr_accessor :data

  def initialize
    @data = []
  end

  class << self
    def load
      instance.data = File.readlines(DEFAULT_DICTIONARY_PATH).map(&:strip)
    end

    def exists?(word)
      instance.data.include?(word)
    end
  end
end

BoggleDictionary.load
