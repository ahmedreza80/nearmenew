class RegisterationNumbersController < ApplicationController
	before_action :check_agent

	def new

	end

	def index
		@numbers = current_user.registeration_numbers
	end

	def create
		number = current_user.registeration_numbers.create()
		redirect_to registeration_number_path number.id
	end

	def show
		@number = current_user.registeration_numbers.find(params[:id])
	end

	private
	def check_agent
		current_user && current_user.is_agent?
	end
end
