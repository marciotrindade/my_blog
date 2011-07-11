Blog::Application.routes.draw do
  namespace :admin do
    root :to => "pages#home", :via => :get
    resources :pages, :except => [:show]
    resources :roles, :except => [:show]
    resources :contacts, :except => [:show]
    resources :posts, :except => [:show]
    resources :categories, :except => [:show]
    resources :comments, :except => [:show]
    resources :users, :except => [:show]
  end

  resources :pages, :only => :show
  resources :categories, :only => :show
  resources :contacts, :only => [:new, :create]
  resources :posts, :only => :show do
    resources :comments, :only => :create
  end

  get '/posts.atom', :controller => 'posts', :action => "index", :format => "atom", :as => :feed
  get ':year(/:month(/:day(.:format)))', :controller => "posts", :action => "by_date", :year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/
  get ':year/:month/:day/:id(.:format)', :controller => "posts", :action => "show", :year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/

  # login
  devise_for :users, :controllers => { :sessions => 'users' }
  # root
  root :to => "posts#index", :via => :get
end
