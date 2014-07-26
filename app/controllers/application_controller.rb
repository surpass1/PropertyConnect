class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
		if current_user.nil? # user is not logged in
		session[:next] = request.fullpath
		redirect_to login_url,
		:alert => "Please log in to continue."
		else
				
			if request.env["HTTP_REFERER"].present?
			redirect_to :back, :alert => exception.message
			else
			render :file => "#{Rails.root}/app/views/home.html.erb",
			:status => 403, :layout => false
			end
		end
	end
	
end
