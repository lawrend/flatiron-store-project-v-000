class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :recoverable,
  # :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
  has_many :carts

  def current_cart=(user_id)
    if user_id == nil
      if self.current_cart
        self.current_cart.destroy
      end
      @current_cart = nil
    elsif Cart.find_by(:user_id => user_id)
      @current_cart = Cart.find_by(:user_id => user_id)
    else
      @current_cart = Cart.create(:user_id => user_id)
    end
  end

  def current_cart
    if Cart.find_by(:user_id => self.id) == nil
      @current_cart = nil
    else
      @current_cart = Cart.find_by(:user_id => self.id)
    end
  end
end
