Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'location', to: 'home#location'
  get 'about_us', to: 'home#about_us'
  get 'coupons', to: 'home#coupons'
  get 'shop_tires', to: 'home#shop_tires'
  get 'contact_us', to: 'home#contact_us'
  get 'term', to: 'home#term'
  get 'privacy', to: 'home#privacy'
  get 'career', to: 'home#career'
  get 'isabel2jade', to: 'home#isabel2jade'
end
