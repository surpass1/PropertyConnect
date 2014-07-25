class HomeController < ApplicationController
  def index
    
      @properties = Property.order("location").page(params[:page]).per(12)
      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @properties }
      end
  end
end
