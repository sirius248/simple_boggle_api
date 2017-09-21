class Boggle < ApplicationRecord
  validates :data, presence: true
  validate :correct_input_data

  def correct_input_data
    if data.size != 16
      errors.add(:data, "Incorrect input data.")
    end
  end

  def board
    @board ||= BoardFactory.create(data: data)
  end
end
