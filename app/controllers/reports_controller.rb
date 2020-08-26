class ReportsController < ApplicationController

  #renders all reports (index) page
  get '/reports' do
    redirect_if_not_logged_in
    @reports = Report.all
    erb :'reports/index'
  end

  #renders new report form
  get '/reports/new' do
    redirect_if_not_logged_in
    erb :'reports/new'
  end

  #processes new report form
  post '/reports' do
    redirect_if_not_logged_in
    @report = Report.create(params)
    @report.user_id = session[:user_id]
    @report.save
    redirect "/reports/#{@report.id}"
  end

  #renders a single report from user
  get '/reports/:id' do
    redirect_if_not_logged_in
    # fix_blank_entries
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
    @report = Report.find_by(id: params[:id])
    if check_owner(@report)
      @report.update(params[:report])
    end
    redirect "reports/#{@report.id}"
  end

  #deletes a report
  delete '/reports/:id' do
    redirect_if_not_logged_in
    @report = Report.find_by(id: params[:id])
    if check_owner(@report)
      @report.delete
    end
    redirect "reports/#{@report.id}"
  end


end