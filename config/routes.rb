Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'location', to: 'home#location'
  get 'about_us', to: 'home#about_us'
  get 'special_deals', to: 'home#special_deals'
  get 'shop_tires', to: 'home#shop_tires'
  get 'contact_us', to: 'home#contact_us'
  get 'term', to: 'home#term'
  get 'privacy', to: 'home#privacy'
  get 'career', to: 'home#career'
  get 'isabel2jade', to: 'home#isabel2jade'
end
