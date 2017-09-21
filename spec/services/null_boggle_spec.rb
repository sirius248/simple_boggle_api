require 'rails_helper'

RSpec.describe NullBoggle, type: :service do
  let(:null_boggle) { NullBoggle.new }

  describe '#new' do
    it do
      expect(null_boggle.board.size).to eq(4)
    end
  end
end
