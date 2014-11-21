Rails.application.routes.draw do
  #get 'rooms/index' la ruta es localhost:3000/rooms/index

  #get 'rooms' => 'rooms#index'

  resources :rooms do
    collection do
      get 'top'
    end
  end

  resources :reservations
end
