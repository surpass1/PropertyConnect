class HomeController < ApplicationController
  def index
    
      @properties = Property.order("title").page(params[:page]).per(1)
      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @properties }
      end
  end
end
