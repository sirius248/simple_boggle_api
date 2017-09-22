Rails.application.routes.draw do
  resources :boggles, only: [:create] do
    collection do
      get :current_board
      get :check
      get :found_words
      get :play_game
    end
  end
end
