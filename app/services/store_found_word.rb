class StoreFoundWord
  def self.call(boggle, response)
    new(boggle, response).call
  end

  attr_reader :boggle, :response

  def initialize(boggle, response)
    @boggle = boggle
    @response = response
  end

  def call
    boggle.words.create(content: response[:query]) if response[:exist]
  end
end
