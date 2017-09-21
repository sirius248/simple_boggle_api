class BogglesController < ApplicationController
  def create
    Boggle.create(data: processed_data)
    render json: {}, status: :created
  end

  def check
    render json: BoggleChecker.call(boggle: BoggleFinder.current, query: params[:query]), status: :ok
  end

  def current_board
    render json: { current_board: BoggleFinder.current.board }, status: :ok
  end

  private

  def processed_data
    params[:data].split(",").map(&:strip)
  end
end
