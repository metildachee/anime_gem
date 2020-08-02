Rails.application.routes.draw do

  resources :mangas
  resources :artists
  resources :genres
  root :to => 'mangas#index'
end
