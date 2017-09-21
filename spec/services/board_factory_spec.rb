require 'rails_helper'

RSpec.describe BoardFactory, type: :service do
  let(:data) { "T, A, P, *, E, A, K, S, O, B, R, S, S, *, X, D".split(",").map(&:strip) }
  let(:board) {
    [
      ["T", "A", "P", "*"],
      %w[E A K S],
      %w[O B R S],
      ["S", "*", "X", "D"]
    ]
  }

  describe '#self.create' do
    it do
      expect(BoardFactory.create(data: data)).to eq(board)
    end
  end
end
