class RegisterationNumbers::OrdersController < RegisterationNumbersController
	before_action :check_rn_belongs_to_right_agent

	def index
		@shops = @rn.shops
	end

	private
	def check_rn_belongs_to_right_agent
		@rn = RegisterationNumber.includes([:shops => [:products => [:items]]]).find(params[:registeration_number_id])
		redirect_to "/" if !(current_user && @rn.user.id  == current_user.id)
	end
end
