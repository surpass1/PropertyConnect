class ProfileController < ApplicationController
	before_filter :authenticate_user!, :except => [:show]
	before_filter :logged_in_user

	  def index
	    @profile = @user.users.all

	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @profile }
	    end
	  end

	  
	  def show
	    @profile = User.find(params[:id])

	    respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @profile }
	    end
	  end

	  
	  def new
	    @profile = User.new

	    respond_to do |format|
	      format.html # new.html.erb
	      format.json { render json: @profile }
	    end
	  end

	  
	  def edit
	    @profile = User.find(params[:id])
	  end


	  def create
	    @profile = @user.users.new(params[:profile])
	    respond_to do |format|
	      if @property.save
	        format.html { redirect_to @profile, notice: 'Property was successfully created.' }
	        format.json { render json: @profile, status: :created, location: @profile }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @profile.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	  
	  def update
	    @profile = User.find(params[:id])

	    respond_to do |format|
	      if @profile.update_attributes(params[:user])
	        format.html { redirect_to @profile, notice: 'Property was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @profile.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	  
	  def destroy
	    @profile = User.find(params[:id])
	    @profile.destroy_all

	    respond_to do |format|
	      format.html { redirect_to users_url }
	      format.json { head :no_content }
	    end
	  end

	private
	def logged_in_user
		@user = current_user
	end
end
