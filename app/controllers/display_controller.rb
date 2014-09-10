class DisplayController < ApplicationController
  def land_sale
  	@lands = Property.where(status: 'sale')

  	respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @property }
    end
  end

  def land_rent
  	@lands = Property.where(status: 'rent')

  	respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @property }
    end
  end

  def land_lease
  	@lands = Property.where(status: 'lease')

  	respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @property }
    end
  end
end
