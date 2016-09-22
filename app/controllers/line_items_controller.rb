class LineItemsController < ApplicationController
  
  def create
  	@user = current_user
  	if @user.current_cart
  	  @current_cart = @user.current_cart
  	else
  	  @current_cart = Cart.create(:user_id => @user.id)
  	end
	@item = Item.find(params[:item_id])
	if @current_cart.items.include?(@item)
	  @line_item = LineItem.find_by(:item_id => @item.id, :cart_id => @current_cart.id)
	  @line_item.quantity += 1
	  @line_item.save
	else
	  @line_item = LineItem.new(:cart_id => @current_cart.id, :item_id => @item.id)
	  @line_item.save
	end
  	redirect_to cart_path(@current_cart)
  end
end
