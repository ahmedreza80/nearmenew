class OrdersController < ApplicationController
	def new
		@order = current_cart.order
	end

	def show
		@orders = Order.all
	end

	def create
		@order = current_cart.order
		if @order.update_attributes(order_params.merge(status:'open'))
			session[:cart_token] = nil
			redirect_to action: 'show'
		else
			render:new
		end
	end

	private
	def order_params
		params.require(:order).permit(:first_name, :las_name, :city, :mobile_number, :delivery_address, :email, :pincode, :tracking)
	end

end