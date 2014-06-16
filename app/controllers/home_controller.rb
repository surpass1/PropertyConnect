class HomeController < ApplicationController
   before_filter :authenticate_user!, :except => [:show, :index]
   def index
    if params[:search]
      @properties = properties..search(params[:search]).order("created_at DESC")

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
