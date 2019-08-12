Rails.application.routes.draw do
  devise_for :users
  root 'welcomes#index'
  get '/menu', to: 'welcomes#menu'
  #get '/offer', to: 'welcomes#offer'
  #get '/offers/:offer_id', to: 'offers#details', as: 'details'
  get '/about_us', to: 'welcomes#about_us'
  get '/contact_us', to: 'welcomes#contact_us'
  post '/send_message', to: 'welcomes#send_message'
  post '/add_to_cart', to: 'carts#add_to_cart'
  get '/subscription', to: 'charges#subscription'
  post '/create_subscription', to: 'charges#create_subscription'

  get '/invoice_email', to: 'users#invoice_email' 
  get '/order_history/', to: 'charges#order_history'
  #delete '/order_destroy/:id', to: 'charges#order_destroy'
  #get '/order_show/:id', to: 'charges#order_show'
  #get '/carts/:id', to: 'carts#pdf_invoice
  resources :carts, only: [:show]
  resources :charges
  resources :offers, only: [:index, :show]
  resources :cart_items, only: [:edit, :update, :destroy] do
    collection do
      delete :delete_all
    end
  end
  resources :invoices, only: [:show] 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
