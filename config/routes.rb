Rails.application.routes.draw do

  resources :mangas
  resources :artists
  root :to => 'mangas#index'
end
