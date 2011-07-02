Blog::Application.routes.draw do
  resources :pages

  namespace :admin do
    root :to => "pages#home"
    resources :pages, :except => [:show]
    resources :roles, :except => [:show]
    resources :contacts, :except => [:show]
    resources :posts, :except => [:show]
    resources :categories, :except => [:show]
    resources :comments, :except => [:show]
    resources :pending_comments, :except => [:show]
    resources :users, :except => [:show] do
      put :update_profile, :on => :member
      collection do
        get :profile
      end
    end
  end

  resources :pages, :only => :show
  resources :categories, :only => :show
  resources :contacts, :only => [:new, :create]
  resources :posts, :only => :show do
    resources :comments, :only => :create
  end

  match '/posts.atom', :controller => 'posts', :action => "index", :format => "atom", :as => :feed
  match ':year(/:month(/:day(.:format)))', :controller => "posts", :action => "by_date", :year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/
  match ':year/:month/:day/:id(.:format)', :controller => "posts", :action => "show", :year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/

  # login
  devise_for :users, :controllers => { :sessions => 'users' }
  # root
  root :to => "posts#index"
end
