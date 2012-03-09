require 'spec_helper'

describe "routes" do
  describe "for root" do
    respond_to_route({:get    => '/'},                                {:controller=>"posts", :action=>"index"})
  end

  describe "for pages" do
    respond_to_route({:get    => '/pages/1'},                         {:controller=>"pages", :action=>"show", :id=>"1"})
  end

  describe "for categories" do
    respond_to_route({:get    => '/categories/1'},                    {:controller=>"categories", :action=>"show", :id=>"1"})
  end

  describe "for contacts" do
    respond_to_route({:post   => '/contacts'},                        {:controller=>"contacts", :action=>"create"})
    respond_to_route({:get    => '/contacts/new'},                    {:controller=>"contacts", :action=>"new"})
  end

  describe "for posts" do
    respond_to_route({:get    => '/posts/1'},                         {:controller=>"posts", :action=>"show", :id=>"1"})
    respond_to_route({:get    => '/posts.atom'},                      {:controller=>"posts", :action=>"index", :format=>"atom"})
    respond_to_route({:get    => '/2011'},                            {:controller=>"posts", :action=>"by_date", :year=>"2011"})
    respond_to_route({:get    => '/2011/07'},                         {:controller=>"posts", :action=>"by_date", :year=>"2011", :month=>"07"})
    respond_to_route({:get    => '//2011/07/07/1'},                   {:controller=>"posts", :action=>"show", :year=>"2011", :month=>"07", :day=>"07", :id=>"1"})
    it "should redirect to month" do
      {:get => '/2011/07/07'}.should_not be_routable
    end
  end

  describe "for users" do
    respond_to_route({:get    => '/users/sign_in'},                   {:controller=>"devise/sessions", :action=>"new"})
    respond_to_route({:post   => '/users/sign_in'},                   {:controller=>"devise/sessions", :action=>"create"})
  end

  describe "for passwords" do
    respond_to_route({:post   => '/users/password'},                  {:controller=>"devise/passwords", :action=>"create"})
    respond_to_route({:get    => '/users/password/new'},              {:controller=>"devise/passwords", :action=>"new"})
    respond_to_route({:get    => '/users/password/edit'},             {:controller=>"devise/passwords", :action=>"edit"})
    respond_to_route({:put    => '/users/password'},                  {:controller=>"devise/passwords", :action=>"update"})
  end

  describe "for registrations" do
    respond_to_route({:get    => '/users/cancel'},                    {:controller=>"devise/registrations", :action=>"cancel"})
    respond_to_route({:post   => '/users'},                           {:controller=>"devise/registrations", :action=>"create"})
    respond_to_route({:get    => '/users/sign_up'},                   {:controller=>"devise/registrations", :action=>"new"})
    respond_to_route({:get    => '/users/edit'},                      {:controller=>"devise/registrations", :action=>"edit"})
    respond_to_route({:put    => '/users'},                           {:controller=>"devise/registrations", :action=>"update"})
    respond_to_route({:delete => '/users'},                           {:controller=>"devise/registrations", :action=>"destroy"})
  end

  describe "for admin" do
    describe "root" do
      respond_to_route({:get    => '/admin'},                           {:controller=>"admin/pages", :action=>"home"})
    end

    describe "pages" do
      respond_to_route({:get    => '/admin/pages'},                     {:controller=>"admin/pages", :action=>"index"})
      respond_to_route({:post   => '/admin/pages'},                     {:controller=>"admin/pages", :action=>"create"})
      respond_to_route({:get    => '/admin/pages/new'},                 {:controller=>"admin/pages", :action=>"new"})
      respond_to_route({:get    => '/admin/pages/1/edit'},              {:controller=>"admin/pages", :action=>"edit", :id=>"1"})
      respond_to_route({:put    => '/admin/pages/1'},                   {:controller=>"admin/pages", :action=>"update", :id=>"1"})
      respond_to_route({:delete => '/admin/pages/1'},                   {:controller=>"admin/pages", :action=>"destroy", :id=>"1"})
    end

    describe "roles" do
      respond_to_route({:get    => '/admin/roles'},                     {:controller=>"admin/roles", :action=>"index", })
      respond_to_route({:post   => '/admin/roles'},                     {:controller=>"admin/roles", :action=>"create"})
      respond_to_route({:get    => '/admin/roles/new'},                 {:controller=>"admin/roles", :action=>"new"})
      respond_to_route({:get    => '/admin/roles/1/edit'},              {:controller=>"admin/roles", :action=>"edit", :id=>"1"})
      respond_to_route({:put    => '/admin/roles/1'},                   {:controller=>"admin/roles", :action=>"update", :id=>"1"})
      respond_to_route({:delete => '/admin/roles/1'},                   {:controller=>"admin/roles", :action=>"destroy", :id=>"1"})
    end

    describe "contacts" do
      respond_to_route({:get    => '/admin/contacts'},                  {:controller=>"admin/contacts", :action=>"index"})
      respond_to_route({:post   => '/admin/contacts'},                  {:controller=>"admin/contacts", :action=>"create"})
      respond_to_route({:get    => '/admin/contacts/new'},              {:controller=>"admin/contacts", :action=>"new"})
      respond_to_route({:get    => '/admin/contacts/1/edit'},           {:controller=>"admin/contacts", :action=>"edit", :id=>"1"})
      respond_to_route({:put    => '/admin/contacts/1'},                {:controller=>"admin/contacts", :action=>"update", :id=>"1"})
      respond_to_route({:delete => '/admin/contacts/1'},                {:controller=>"admin/contacts", :action=>"destroy", :id=>"1"})
    end

    describe "posts" do
      respond_to_route({:get    => '/admin/posts'},                     {:controller=>"admin/posts", :action=>"index"})
      respond_to_route({:post   => '/admin/posts'},                     {:controller=>"admin/posts", :action=>"create"})
      respond_to_route({:get    => '/admin/posts/new'},                 {:controller=>"admin/posts", :action=>"new"})
      respond_to_route({:get    => '/admin/posts/1/edit'},              {:controller=>"admin/posts", :action=>"edit", :id=>"1"})
      respond_to_route({:put    => '/admin/posts/1'},                   {:controller=>"admin/posts", :action=>"update", :id=>"1"})
      respond_to_route({:delete => '/admin/posts/1'},                   {:controller=>"admin/posts", :action=>"destroy", :id=>"1"})
    end

    describe "categories" do
      respond_to_route({:get    => '/admin/categories'},                {:controller=>"admin/categories", :action=>"index"})
      respond_to_route({:post   => '/admin/categories'},                {:controller=>"admin/categories", :action=>"create"})
      respond_to_route({:get    => '/admin/categories/new'},            {:controller=>"admin/categories", :action=>"new"})
      respond_to_route({:get    => '/admin/categories/1/edit'},         {:controller=>"admin/categories", :action=>"edit", :id=>"1"})
      respond_to_route({:put    => '/admin/categories/1'},              {:controller=>"admin/categories", :action=>"update", :id=>"1"})
      respond_to_route({:delete => '/admin/categories/1'},              {:controller=>"admin/categories", :action=>"destroy", :id=>"1"})
    end

    describe "comments" do
      respond_to_route({:get    => '/admin/comments'},                  {:controller=>"admin/comments", :action=>"index"})
      respond_to_route({:post   => '/admin/comments'},                  {:controller=>"admin/comments", :action=>"create"})
      respond_to_route({:get    => '/admin/comments/new'},              {:controller=>"admin/comments", :action=>"new"})
      respond_to_route({:get    => '/admin/comments/1/edit'},           {:controller=>"admin/comments", :action=>"edit", :id=>"1"})
      respond_to_route({:put    => '/admin/comments/1'},                {:controller=>"admin/comments", :action=>"update", :id=>"1"})
      respond_to_route({:delete => '/admin/comments/1'},                {:controller=>"admin/comments", :action=>"destroy", :id=>"1"})
    end

    describe "users" do
      respond_to_route({:get    => '/admin/users'},                     {:controller=>"admin/users", :action=>"index"})
      respond_to_route({:post   => '/admin/users'},                     {:controller=>"admin/users", :action=>"create"})
      respond_to_route({:get    => '/admin/users/new'},                 {:controller=>"admin/users", :action=>"new"})
      respond_to_route({:get    => '/admin/users/1/edit'},              {:controller=>"admin/users", :action=>"edit", :id=>"1"})
      respond_to_route({:put    => '/admin/users/1'},                   {:controller=>"admin/users", :action=>"update", :id=>"1"})
      respond_to_route({:delete => '/admin/users/1'},                   {:controller=>"admin/users", :action=>"destroy", :id=>"1"})
    end
  end
end
