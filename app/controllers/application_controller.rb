class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  register Sinatra::Flash

  get '/' do
    erb :'home' #renders home page (not specific to user or report actions)
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_logged_in
      if !current_user
        flash[:notloggedin] = "You must log in to see that page"
        redirect '/login'
      end
    end

    def check_owner(obj)
      obj.user == current_user
    end
  end

end