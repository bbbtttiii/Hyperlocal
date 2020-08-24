class UsersController < ApplicationController

    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'users/show'
    end
  
    #generate login
    get "/login" do
        if !logged_in?
            erb :"/users/login"
        else
            redirect to '/index'
        end
    end
  
    #submit login
    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect to "/users/#{user.id}"
        else
          redirect to '/login'
        end
    end
  
    #display sign up form
    get '/signup' do
        if !logged_in?
            erb :'/users/signup'
        else
            redirect to '/index'
        end
    end

    #process sign up form (if form isn't fully filled out, redirect to sign up - otherwise, create user and save to DB)
    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect to '/signup'
        else
            @user = User.create(:username => params[:username], :password => params[:password])
            session[:user_id] = @user.id
            redirect "/index"
        end
    end

    # GET: /users/5
    get "/users/:id" do
        if logged_in?
            @user = User.find_by(params)
            @reports = @user.reports
            erb :"/users/show"
        else
            redirect to '/login'
        end
    end
  
    # LOGOUT
    get "/logout" do
        if logged_in?
          session.destroy
          redirect to '/login'
        else
          redirect to '/'
        end
    end

  end
  