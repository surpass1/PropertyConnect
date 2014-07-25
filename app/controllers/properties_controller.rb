class PropertiesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  before_filter :logged_in_user 
  #load_and_authorize_resource :except => [:show]

  
  def index
    @properties = Property.all
    # if params[:search]
    #   @properties = @user.properties.search(params[:search], params[:page]).order("created_at DESC")
      

    #   respond_to do |format|
    #     format.html # index.html.erb
    #     format.json { render json: @properties }
    #   end
    # else
    #   @properties = Property.order("created_at DESC")
    # end

  end

  
  def show
    @property = Property.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @property }
    end
  end

  
  def new
    @property = Property.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @property }
    end
  end

  
  def edit
    @property = Property.find(params[:id])
  end


  def create
    @property = @user.properties.new(params[:property])
    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render json: @property, status: :created, location: @property }
      else
        format.html { render action: "new" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    @property = Property.find(params[:id])

    respond_to do |format|
      if @property.update_attributes(params[:property])
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @property = Property.find(params[:id])
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_url }
      format.json { head :no_content }
    end
  end

  private 
  def logged_in_user
    @user = current_user
  end
end
