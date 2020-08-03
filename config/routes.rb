Rails.application.routes.draw do

  resources :mangas
  resources :artists
  resources :genres
  resources :actors
  root :to => 'mangas#index'
end
