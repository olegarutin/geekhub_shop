Category.create(title: 'Fruits')
Category.create(title: 'Vegetables')

User.create(admin: true, email: 'admin@gmail.com', password: 123456)

12.times do
  product = Product.create(title: Faker::Food.fruits, description: 'Fruits from Europe', price: Faker::Number.decimal(l_digits: 3), category_id: 6)
  product.images.attach(io: File.open(File.join(Rails.root,'app/assets/images/fruits.jpg')), filename: 'fruits.jpg')
end

12.times do
  product = Product.create(title: Faker::Food.vegetables, description: 'Vegetables from Europe', price: Faker::Number.decimal(l_digits: 3), category_id: 7)
  product.images.attach(io: File.open(File.join(Rails.root,'app/assets/images/vegetables.jpg')), filename: 'vegetables.jpg')
end
