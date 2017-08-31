Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users,
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
             controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  resources :users, only: [:show]

  resources :items, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'details'
    end
    resources :photos, only: [:create, :destroy]
    resources :item_purchases, only: [:create]
  end

  get '/your_purchases' => 'item_purchases#your_purchases'
  get '/your_orders' => 'item_purchases#your_orders'
  get '/konfam_market' => 'items#konfam_market'

  resources :gigs, except: [:edit] do
     member do
       get 'listing'
       get 'description'
       get 'logistics'
       get 'compensation'
     end
  end
  get '/all_gigs' => 'gigs#all_gigs'

  resources :services, except: [:edit] do
     member do
       get 'listing'
       get 'description'
       get 'pricing'
       get 'photo_uploads'
       get 'details'
     end
     resources :service_photos, only: [:create, :destroy]
     resources :bookings, only: [:create]
  end
  get '/all_services' => 'services#all_services'

  get '/your_requests' => 'bookings#your_requests'
  get '/your_offers' => 'bookings#your_offers'


end
