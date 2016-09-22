class RemoveSubmittedFromCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :submitted, :boolean
  end
end
