Rails.application.routes.draw do
  get 'about/index'
  get 'homes/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "homes#index"
  get '/faq', to: 'homes#faq'

  # Contact page (separate form)
  get '/contact', to: 'homes#contact', as: :contact
  post '/contact', to: 'homes#contact_submit'

  # Terms and Privacy pages
  get '/terms', to: 'homes#terms', as: :terms
  get '/privacy', to: 'homes#privacy', as: :privacy
  get '/about', to: 'homes#about', as: :about
  get "/brochure", to: "homes#brochure", as: :brochure
  get "/album", to: "homes#album", as: :album
end
