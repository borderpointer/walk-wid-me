Rails.application.routes.draw do

  resources :videos, only: [:index], defaults: {format: :json}

  get 'videos/:id' => 'videos#show', as: "video"
  root "videos#show"

  devise_for :users, controllers: { registrations: "registrations"}

end
