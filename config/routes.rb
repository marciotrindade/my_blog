Blog::Application.routes.draw do
  namespace :admin do
    root :to => "pages#home"
    resources :pages, :except => [:show]
    resources :roles, :except => [:show]
    resources :contacts, :except => [:show]
    resources :posts, :except => [:show]
    resources :users, :except => [:show] do
      put :update_profile, :on => :member
      collection do
        get :profile
      end
    end
  end

  resources :contacts, :only => [:new, :create]
  resources :posts, :only => [:index, :show]

  match ':year(/:month(/:day(.:format)))',       :controller => "posts", :action => "find_by_date", :year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/
  match ':year(/:month(/:day(/:id(.:format))))', :controller => "posts", :action => "show",         :year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/

  match "pages/:action", :controller => :pages, :as => :pages

  # login
  devise_for :users, :controllers => { :sessions => 'users' }
  # root
  root :to => "posts#index"
end
