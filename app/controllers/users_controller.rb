class UsersController < ApplicationController
	def change_city
		params[:state]
		@state = CS.states(:in).key(params[:state])
	end
end
