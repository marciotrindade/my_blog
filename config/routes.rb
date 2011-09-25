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

  match '/pages/contato' => redirect('/contacts/new')
  match '/pages/sitemap' => redirect('/sitemap')
  match 'sitemap', :to => 'pages#sitemap', :as => 'sitemap'

  resources :pages,       :only => :show
  resources :categories,  :only => :show
  resources :contacts,    :only => [:new, :create]
  resources :posts,       :only => :show do
    resources :comments,  :only => :create
  end

  get '/posts.atom', :controller => 'posts', :action => "index", :format => "atom", :as => "feed"
  get '/comments.atom', :controller => 'comments', :action => "index", :format => "atom"
  get ':year(/:month(.:format))', :controller => "posts", :action => "by_date", :year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/
  get ':year/:month/:day/:id(.:format)', :controller => "posts", :action => "show", :year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/
  match ":year/:month/:day" => redirect("/%{year}/%{month}"), :year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/

  devise_for :users

  root :to => "posts#index", :via => :get
end
