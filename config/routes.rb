Rails.application.routes.draw do
  resources :boggles, only: [:create] do
    collection do
      get :current_board
      get :check
    end
  end
end
