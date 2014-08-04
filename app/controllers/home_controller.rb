class HomeController < ApplicationController
  def index
    
      @properties = Property.order("location").page(params[:page]).per(6)
      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @properties }
      end
  end

  def make
  	@properties = MyProperty.order("village").page(params[:page]).per(6)
      
    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @properties }
    end
  end
end
