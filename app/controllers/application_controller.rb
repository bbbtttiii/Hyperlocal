require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public' #where static files should be served from
    set :views, 'app/views' #where views are located
    enable :sessions #boolean setting to enable sessions 
    set :session_secret, ENV['SESSION_SECRET'] #sets passkey for session
  end

  register Sinatra::Flash

  get '/' do
    erb :'home' #renders home page (not specific to user or report actions)
  end

  helpers do
    def logged_in?
      !!session[:user_id] #if session with user id exists -> true
    end

    def current_user
      User.find(session[:user_id]) if session[:user_id] #find user based on session w/ user
    end

    def redirect_if_not_logged_in
      if !current_user
        flash[:notloggedin] = "You must log in to see that page"
        redirect '/login'
        return
      end
    end

    def check_owner(obj) #
      obj.user == current_user
    end

    def active_page?(path='')
      request.path_info == '/' + path
    end

  end

end