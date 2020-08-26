class UsersController < ApplicationController

    #renders sign up page
    get '/signup' do
      if current_user
        redirect '/reports'
      end
      erb :'users/signup'
    end
  
    #renders login page
    get '/login' do
      if current_user
        flash[:message] = "Already logged in!"
        redirect '/reports'
      end
      erb :'users/login'
    end
  
    #processes sign up page
    post '/signup' do
      user = User.create(params)
      if user.valid?
        session[:user_id] = user.id
        redirect "/users/#{user.id}"
      else
        # flash[:message] = user.errors.full_messages
        redirect '/signup'
      end
    end

    #processes login page
    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect "/users/#{@user.id}"
        else
          flash[:message] = "Invalid Login"
          erb :'/users/login'
        end
    end    
  
    #renders the logged in user's page
    get '/users/:id' do
      @user = User.find_by(params)
      if @user == current_user
        @reports = @user.reports
        erb :'users/show'
      else
        # flash[:error] = "You must log in to see that page"
        erb :'/users/login'
      end
    end
  
    #logs out the user
    get '/logout' do
      session.clear
      redirect '/login'
    end
  
  end