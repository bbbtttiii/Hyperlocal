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
      if params[:field] == ""
        redirect to "/reports/new"
      else
        report = Report.create(params)
        item.user_id = session[:user_id]
        item.save
        redirect "/reports#{report.id}"
      end
    else
      redirect to '/login'
    end
  end

  # GET: /reports/5
  get "/reports/:id" do
    if logged_in?
      erb :"/reports/show"
    else
      redirect to '/login'
    end
  end




  # GET: /reports/5/edit
  get "/reports/:id/edit" do
    erb :"/reports/edit"
  end

  # PATCH: /reports/5
  patch "/reports/:id" do
    redirect "/reports/:id"
  end

  # DELETE: /reports/5/delete
  delete "/reports/:id/delete" do
    redirect "/reports"
  end

end
