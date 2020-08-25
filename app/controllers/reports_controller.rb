class ReportsController < ApplicationController

  get '/reports' do
    redirect_if_not_logged_in
    @reports = Report.all
    erb :'reports/index'
  end

  get '/reports/new' do
    redirect_if_not_logged_in
    erb :'reports/new'
  end

  post '/reports' do
    redirect_if_not_logged_in
    @report = Report.create(params)
    @report.user_id = session[:user_id]
    @report.save
    redirect "/reports/#{@report.id}"
  end

  get '/reports/:id' do
    redirect_if_not_logged_in
    if @report = Report.find_by(params)
      erb :'reports/show'
    else
      redirect '/reports'
    end
  end

  get '/reports/:id/edit' do
    redirect_if_not_logged_in
    @report = Report.find_by(params)
    if !check_owner(@report)
      redirect '/reports'
    end
    erb :'reports/edit'
  end

  patch '/reports/:id' do
    redirect_if_not_logged_in
    @report = Report.find_by(id: params[:id])
    if check_owner(@report)
      @report.update(params[:report])
    end
    redirect "reports/#{@report.id}"
  end

  delete '/reports/:id' do
    redirect_if_not_logged_in
    report = Report.find_by(id: params[:id])
    if check_owner(report)
        report.delete
    end
      redirect '/reports'
  end


end