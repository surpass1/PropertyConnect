class MyPropertiesController < ApplicationController
 
  def index
    @my_properties = MyProperty.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @my_properties }
    end
  end

  def show
    @my_property = MyProperty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @my_property }
    end
  end

  def new
    @my_property = MyProperty.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @my_property }
    end
  end

  def edit
    @my_property = MyProperty.find(params[:id])
  end

  def create
    @my_property = MyProperty.new(params[:my_property])

    respond_to do |format|
      if @my_property.save
        format.html { redirect_to @my_property, notice: 'My property was successfully created.' }
        format.json { render json: @my_property, status: :created, location: @my_property }
      else
        format.html { render action: "new" }
        format.json { render json: @my_property.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @my_property = MyProperty.find(params[:id])

    respond_to do |format|
      if @my_property.update_attributes(params[:my_property])
        format.html { redirect_to @my_property, notice: 'My property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @my_property.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @my_property = MyProperty.find(params[:id])
    @my_property.destroy

    respond_to do |format|
      format.html { redirect_to my_properties_url }
      format.json { head :no_content }
    end
  end
end
