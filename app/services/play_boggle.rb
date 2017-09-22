require 'boggle_dictionary'

class PlayBoggle
  def self.call(boggle:, timer:)
    new(boggle, timer).call
  end

  attr_reader :boggle, :timer, :found_words, :timer

  def initialize(boggle, timer)
    @boggle = boggle
    @timer = timer.to_i
    @stop_watch = Time.current.to_i + @timer.to_i
    @found_words = []
    init_timer
  end

  def call
    while Time.current.to_i < @stop_watch
      query = BoggleDictionary.sample
      response = BoggleChecker.call(boggle: boggle, query: query)
      found_words << query if response[:exist]
    end
    self
  end

  private

  def init_timer
    if timer
      @timer = 3.minutes if timer > 3.minutes.to_i
    else
      @timer = 1.minutes
    end
  end
end
