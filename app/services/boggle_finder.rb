class BoggleFinder
  def self.current
    Boggle.order(created_at: :desc).first || NullBoggle.new
  end
end
