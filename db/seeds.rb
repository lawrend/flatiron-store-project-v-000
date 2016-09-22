if Item.all.count == 0

	10.times do 
	  Item.create(
	    title: Faker::Commerce.product_name, 
	    inventory: Faker::Number.number(2), 
	    price: Faker::Number.number(4)
	  )
	  Category.create(title: Faker::Commerce.department)
	end

	counter = 1
	Item.all.each do |item|
	  item.category_id = counter
	  item.save
	  counter += 1
	end
end

if User.all.count == 0
	User.create(:email => "dave@dave.com", :password => "testtest", :password_confirmation => "testtest")
	User.create(:email => "joe@joe.com", :password => "testtest", :password_confirmation => "testtest")
end
