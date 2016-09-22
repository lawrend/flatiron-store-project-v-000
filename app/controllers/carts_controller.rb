class CartsController < ApplicationController
	def create
		@cart = Cart.create(:user_id => current_user.id)
	end

	def show
		@current_cart = current_user.current_cart
		if @current_cart.status == "submitted"
			current_user.current_cart = nil
			current_user.current_cart.destroy
		end
		@line_items = @current_cart.line_items
		@total = @current_cart.total
		@status = @current_cart.status
	end

	def checkout
	  @user = current_user
	  @current_cart = @user.current_cart
	  @user.current_cart.line_items.each do |line_item|
	  	  item = Item.find(line_item.item_id)
          item.inventory -= line_item.quantity
          item.save
      end
      @current_cart.status = "submitted"
      @current_cart.save
      redirect_to cart_path(@current_cart)
	end

	def destroy
	end

end
