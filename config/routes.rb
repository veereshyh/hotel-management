Rails.application.routes.draw do
  root "hotels#index"

  resources :users, only: [:create, :show]
  resources :hotels, only: %i(index create show) do
    put '/checkin/', action: :checkin, on: :member
    put '/checkout/', action: :checkout, on: :member
    get '/available_rooms', action: :available_rooms
  end
end
