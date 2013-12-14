Blog::Application.routes.draw do
  devise_for :users

  root :to => "posts#index", :via => :get
  get 'sitemap', :to => 'pages#sitemap', :as => 'sitemap'
  get '/posts.atom', :controller => 'posts', :action => "index", :format => "atom", :as => "feed"
  get '/comments.atom', :controller => 'comments', :action => "index", :format => "atom"
  get ':year(/:month(.:format))', :controller => "posts", :action => "by_date", :year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/
  get ':year/:month/:day/:id(.:format)', :controller => "posts", :action => "show", :year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/

  resources :pages,       :only => :show
  resources :categories,  :only => :show
  resources :contacts,    :only => [:new, :create]
  resources :posts,       :only => :show do
    resources :comments,  :only => :create
  end

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

end
