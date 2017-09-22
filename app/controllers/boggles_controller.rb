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

  def play_game
    result = PlayBoggle.call(boggle: BoggleFinder.current, timer: params[:timer])
    render json: {
      timer: result.timer,
      count: result.found_words.size,
      found_words: result.found_words
    }
  end

  def found_words
    render json: {
      found_words: BoggleFinder.current.words.pluck(:content),
      current_board: BoggleFinder.current.board
    }, status: :ok
  end

  private

  def processed_data
    params[:data].split(",").map(&:strip)
  end
end
