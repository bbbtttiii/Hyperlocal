class ReportsController < ApplicationController

  #renders reports from all users (index page)
  get '/reports' do 
    redirect_if_not_logged_in 
    @reports = Report.all #sets instance variable to all method of Report obj
    erb :'reports/index' #renders index page
  end

  #renders new report form
  get '/reports/new' do
    redirect_if_not_logged_in
    erb :'reports/new'
  end

  #processes new report form
  post '/reports' do
    redirect_if_not_logged_in
    if params[:current_conditions].empty?
      flash[:req] = "Current conditions are required"
      redirect 'reports/new'
    else
      @report = Report.create(params)
      @report.user_id = session[:user_id] #associates the report with the curent session user
      @report.save
      redirect "/reports/#{@report.id}"
    end
  end

  #shows the latest report
  get '/reports/newest' do
    redirect_if_not_logged_in
    @latest_report = Report.order(updated_at: :desc).first
    erb :'reports/newest'
  end

  #renders a single report from user
  get '/reports/:id' do
    redirect_if_not_logged_in
    if @report = Report.find_by(params)
      erb :'reports/show'
    else
      redirect '/reports'
    end
  end

  #renders edit form
  get '/reports/:id/edit' do
    redirect_if_not_logged_in
    @report = Report.find_by(params)
    if !check_owner(@report)
      redirect '/reports'
    end
    erb :'reports/edit'
  end

  #processes edit form
  patch '/reports/:id' do
    redirect_if_not_logged_in
    if params[:report][:current_conditions].empty?
      flash[:req] = "Current conditions are required"
      redirect 'reports/new'
    else
      @report = Report.find_by(id: params[:id])
      if check_owner(@report)
        @report.update(params[:report])
      end
      redirect "reports/#{@report.id}"
    end
  end

  #deletes a report
  delete '/reports/:id' do
    redirect_if_not_logged_in
    @report = Report.find_by(id: params[:id])
    if check_owner(@report)
      @report.delete
    end
    redirect "/users/#{current_user.id}"
  end

end