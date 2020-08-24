class UsersController < ApplicationController
  
    # GET: /login
    get "/login" do
      erb :"/users/login"
    end
  
    # POST: /login
    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect to "/users/#{user.id}"
        else
          redirect to '/signup'
        end
    end
  
    #display sign up form
    get '/signup' do
        if !logged_in?
            erb :'users/signup'
        else
            redirect to '/index'
        end
    end

    #process sign up form (if form isn't fully filled out, redirect to sign up - otherwise, create user and save to DB)
    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect to '/signup'
        else
            @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
            @user.save
            session[:user_id] = @user.id
            redirect to '/reports/index'
        end
    end

    # GET: /users/5
    get "/users/:id" do
      @user = User.find_by(params)
      @reports = @user.reports
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
  
    get "/logout" do
        if logged_in?
          session.destroy
          redirect to '/login'
        else
          redirect to '/'
        end
    end

  end
  