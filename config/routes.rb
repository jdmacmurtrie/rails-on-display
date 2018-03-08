Rails.application.routes.draw do
  root 'galleries#index'
  resources :galleries, only: [:index, :show, :new, :create] do
    resources :art_pieces, only: [:new, :create]
  end

end
