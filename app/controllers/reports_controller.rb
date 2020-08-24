class ReportsController < ApplicationController

  # GET: /reports
  get "/index" do
    if logged_in?
      @reports = Report.all
      erb :"/reports/index"
    else
      redirect to '/login'
    end
  end

  # GET: /reports/new
  get "/reports/new" do
    if logged_in?
      erb :'reports/new'
    else
      redirect to '/login'
    end
  end

  # POST: /reports
  post "/reports" do
    if logged_in?
      report = Report.create(params)
      report.user_id = session[:user_id]
      report.save
      redirect "/reports/#{report.id}"
    else
      redirect to '/login'
    end
  end

  # GET: /reports/5
  get "/reports/:id" do
    if logged_in?
      if @report = Report.find_by(params)
        erb :'reports/show'
      else
        redirect '/index'
      end
    else
      redirect to '/login'
    end
  end

  # GET: /reports/5/edit
  get '/reports/:id/edit' do
    if logged_in?
      @report = Report.find_by(params)
      if @report.user_id != session[:user_id]
        redirect to '/items'
      end
      erb :'/reports/edit'
    else
      redirect to '/login'
    end
  end

  # PATCH: /reports/5
  patch "/reports/:id" do
    if logged_in?
      if params[:field] == ""
        redirect to "/reports/#{params[:id]}/edit"
      else
        @report = Report.find_by(id: params[:id])
        if @report.user_id == session[:user_id]
          if @report.update(params[:report])
            redirect to "/reports/#{@report.id}"
          else
            redirect to "/reports/#{@report.id}/edit"
          end
        else
          redirect to '/index'
        end
      end
    else
      redirect to '/login'
    end
  end

  # DELETE: /reports/5/delete
  delete "/reports/:id/delete" do
    if logged_in?
      @report = Report.find_by_id(params[:id])
      if @report &&report.user == current_user
        @report.delete
      end
      redirect "/reports"
    else
      redirect to "/login"
    end
  end

end
