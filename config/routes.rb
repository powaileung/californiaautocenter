Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :dashboard, only: [:show]
  root 'home#index'
  resources :specialdeals, only: [:index, :show]
  namespace :admin do
    resources :specialdeals, only: [:new, :create, :show, :destroy, :update, :edit]
  end
  get 'location', to: 'home#location'
  get 'about_us', to: 'home#about_us'
  get 'shop_tires', to: 'home#shop_tires'
  get 'contact_us', to: 'home#contact_us'
  get 'term', to: 'home#term'
  get 'privacy', to: 'home#privacy'
  get 'career', to: 'home#career'
  get 'isabel2jade', to: 'home#isabel2jade'
  
  get '/404', to: 'errors#not_found'
  get '/422', to: 'errors#unacceptable'
  get '/500', to: 'errors#server_errors'

end
