Rails.application.routes.draw do

  devise_for :users, :controllers => {
                                      :sessions => 'auth/sessions',
                                      :omniauth_callbacks => 'auth/omniauth_callbacks'
                                     }

  devise_scope :user do
    root :to => 'landing#index'
  end

  resources :wizard
  resources :websites, :only => [:new, :create]

  get 'preview',         :to => 'landing#preview'

end
