class HomeController < ApplicationController
   
   def index
    if params[:search]
      @properties = @user.properties.search(params[:search], params[:page]).order("created_at DESC")
      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @properties }
      end
    else
      @properties = Property.order("created_at DESC")
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @properties }
      end
    end

  end


end
