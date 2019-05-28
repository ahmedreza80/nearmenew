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
			# redirect_to  "/charges/new", locale: {order: @order}
			if params[:order]
            	# redirect_to new_charge_path(:order => params[:order])
            	redirect_to controller: 'charges', action: 'new', first_name: params[:order][:first_name],last_name: params[:order][:last_name],mobile_number: params[:order][:mobile_number],email: params[:order][:email],delivery_address: params[:order][:delivery_address],city: params[:order][:city],pincode: params[:order][:pincode],tracking: params[:order][:tracking], amount: params[:paid_amount][:amount], order_id: @order.id
        	end
		else
			render:new
		end
	end

	private
	def order_params
		params.require(:order).permit(:first_name, :las_name, :city, :mobile_number, :delivery_address, :email, :pincode, :tracking)
	end

end