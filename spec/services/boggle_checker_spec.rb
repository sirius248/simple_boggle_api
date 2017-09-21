require 'rails_helper'

RSpec.describe BoggleChecker, type: :service do
  let(:data) { "T, A, P, *, E, A, K, S, O, B, R, S, S, *, X, D".split(",").map(&:strip) }
  let!(:boggle) { Boggle.create(data: data) }
  let(:exist_queries) { %w[pat tap pass] }
  let(:non_exist_queries) { %w[awesome long tab] }

  describe '.call' do
    context "success queries" do
      it do
        exist_queries.each do |query|
          expect(BoggleChecker.call(boggle: boggle, query: query)[:exist]).to eq(true)
          expect(BoggleChecker.call(boggle: boggle, query: query)[:query]).to eq(query)
        end
      end
    end

    context "fail query" do
      it do
        non_exist_queries.each do |query|
          expect(BoggleChecker.call(boggle: boggle, query: query)[:exist]).to eq(false)
          expect(BoggleChecker.call(boggle: boggle, query: query)[:query]).to eq(query)
        end
      end
    end
  end
end
