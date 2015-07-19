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

  get 'finish_wizard', :to => 'wizard#finish_wizard'

end
