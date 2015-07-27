Rails.application.routes.draw do

  devise_for :users, :controllers => {
                                      :sessions => 'auth/sessions',
                                      :omniauth_callbacks => 'auth/omniauth_callbacks'
                                     }

  devise_scope :user do
    root :to => 'landing#index'
  end

  resources :wizard
  resources :animations
  resources :websites, :only => [:show] do
    get :experiment, :on => :member
  end

  get 'finish_wizard', :to => 'wizard#finish_wizard'

end
