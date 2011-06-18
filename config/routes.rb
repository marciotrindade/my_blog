Blog::Application.routes.draw do
  namespace :admin do
    root :to => "pages#home"
    resources :pages, :except => [:show]
    resources :roles, :except => [:show]
    resources :users, :except => [:show] do
      put :update_profile, :on => :member
      collection do
        get :profile
      end
    end
  end

  # login
  devise_for :users, :controllers => { :sessions => 'users' }
  # root
  root :to => "dolls#index"
end
