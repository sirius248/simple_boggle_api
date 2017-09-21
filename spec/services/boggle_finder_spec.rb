require 'rails_helper'

RSpec.describe BoggleFinder, type: :service do
  let(:data) { "T, A, P, *, E, A, K, S, O, B, R, S, S, *, X, D".split(",").map(&:strip) }
  let(:board) {
    [
      ["T", "A", "P", "*"],
      ["E", "A", "K", "S"],
      ["O", "B", "R", "S"],
      ["S", "*", "X", "D"]
    ]
  }

  describe '.current' do
    context "when there's no boggle in the database" do
      it do
        expect(BoggleFinder.current.board.size).to eq(4)
        expect(BoggleFinder.current.board).not_to eq(board)
      end
    end

    context "when there's a boggle in the databaes" do
      before do
        Boggle.create(data: data)
      end

      it do
        expect(BoggleFinder.current.board.size).to eq(4)
        expect(BoggleFinder.current.board).to eq(board)
      end
    end
  end
end
