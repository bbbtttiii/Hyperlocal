class UsersController < ApplicationController

    # GET: /signup
    get "/signup" do
      erb :"/users/signup"
    end
  
    # GET: /login
    get "/login" do
      erb :"/users/login"
    end
  
    # POST: /login
    post "/users" do
      redirect "/login"
    end
  


    # GET: /users/5
    get "/users/:id" do
      erb :"/users/show"
    end
  
    # GET: /users/5/edit
    get "/users/:id/edit" do
      erb :"/users/edit"
    end
  
    # PATCH: /users/5
    patch "/users/:id" do
      redirect "/users/:id"
    end
  
    # DELETE: /users/5/delete
    delete "/users/:id/delete" do
      redirect "/users"
    end
    
  end
  