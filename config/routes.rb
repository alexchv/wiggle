Rails.application.routes.draw do

  get 'rake/routes'

  devise_for :users, :controllers => {
                                      :sessions => 'auth/sessions',
                                      :omniauth_callbacks => 'auth/omniauth_callbacks'
                                     }

  devise_scope :user do
    root :to => 'landing#index'
  end

  resources :wizard
  resources :users
  resources :animations
  resources :websites, :only => [:show, :update] do
    get :experiment, :on => :member
  end

  get 'finish_wizard', :to => 'wizard#finish_wizard'

  get 'proxy',       :to => 'proxy#highlighter'
  get 'frame_modal', :to => 'animations#frame_modal'
  get 'animate',     :to => 'animated_elements#animate'#, :defaults => { :format => :js }

end
