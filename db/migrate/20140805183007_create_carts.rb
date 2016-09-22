class CreateCarts < ActiveRecord::Migration
  def change
  	create_table :carts do |t|
  		t.boolean :submitted, :default => false
  		t.integer :user_id
  	end
  end
end
