class LandsController < ApplicationController
  before_filter :logged_in_user 
  before_filter :authenticate_user!, :except => [:show]
  def index
    @lands = Land.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lands }
    end
  end
 
  def show
    @land = Land.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @land }
    end
  end

  def new
    @land = Land.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @land }
    end
  end

  def edit
    @land = Land.find(params[:id])
  end

  def create
    @land = Land.new(params[:land])

    respond_to do |format|
      if @land.save
        format.html { redirect_to @land, notice: 'Land was successfully created.' }
        format.json { render json: @land, status: :created, location: @land }
      else
        format.html { render action: "new" }
        format.json { render json: @land.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @land = Land.find(params[:id])

    respond_to do |format|
      if @land.update_attributes(params[:land])
        format.html { redirect_to @land, notice: 'Land was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @land.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @land = Land.find(params[:id])
    @land.destroy

    respond_to do |format|
      format.html { redirect_to lands_url }
      format.json { head :no_content }
    end
  end

  def logged_in_user
    @user = current_user
  end
end
