Rails.application.routes.draw do

namespace :api do
  resources :videos, only: [:index], defaults: {format: :json}
end

  root "videos#show"

end

