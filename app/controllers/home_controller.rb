class HomeController < ApplicationController 
	def index
		render inertia: 'Home', props: { user: current_user && current_user.as_json(only: [:email]) }
	end
end