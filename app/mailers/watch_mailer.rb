class WatchMailer < ApplicationMailer
	def new_update
		@document = params[:document]
		@user = params[:user]
	    
		mail(to: @user.email, subject: "'#{@document.title}' has new updates")
	end
end
