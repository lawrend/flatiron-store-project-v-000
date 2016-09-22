class StoreController < ApplicationController
  def index
    @categories = Category.all
  	@items = Item.all.select{|i| i.inventory > 0 }
  	if user_signed_in?
  	  @user = current_user
  	end
  end
end
