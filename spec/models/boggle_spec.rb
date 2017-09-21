require 'rails_helper'

RSpec.describe Boggle, type: :model do
  let(:data) { "T, A, P, *, E, A, K, S, O, B, R, S, S, *, X, D".split(",").map(&:strip) }
  let(:board) {
    [
      ["T", "A", "P", "*"],
      ["E", "A", "K", "S"],
      ["O", "B", "R", "S"],
      ["S", "*", "X", "D"]
    ]
  }
  let!(:boggle) { Boggle.create(data: data) }

  describe '#board' do
    it do
      expect(boggle.board).to eq(board)
    end
  end
end
