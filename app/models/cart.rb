class Cart < ActiveRecord::Base
	has_many :line_items
	has_many :items, through: :line_items 
	belongs_to :user

	def total
		@total = 0
		self.line_items.each do |line_item|
		  item = Item.find(line_item.item_id)
		  @total += item.price * line_item.quantity
		end
		@total
	end

	def add_item(item_id)
	  if self.items.include?(Item.find(item_id))
	    @line_item = LineItem.find_by(:item_id => item_id, :cart_id => self.id)
	  else
	    @line_item = LineItem.new(:item_id => item_id, :cart_id => self.id)
	  end
	end


end
