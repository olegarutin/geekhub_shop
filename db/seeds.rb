Category.create(title: 'Fruits')
Category.create(title: 'Vegetables')

User.create(admin: true, email: 'admin@gmail.com', password: 123456)

Subcategory.create(title: Faker::Food.fruits, category_id: 2)

9.times do
  Product.create(title: Faker::Food.fruits, description: 'Fruits from Europe', price: Faker::Number.decimal(l_digits: 3), image: 'https://us.123rf.com/450wm/atoss/atoss1412/atoss141200146/34275163-seasonal-organic-raw-fruit-isolated-over-white-background.jpg?ver=6', category_id: 1)
  Product.create(title: Faker::Food.vegetables, description: 'Vegetables from Europe', price: Faker::Number.decimal(l_digits: 3), image: 'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/slideshows/powerhouse_vegetables_slideshow/650x350_powerhouse_vegetables_slideshow.jpg', category_id: 2)
  Product.create(title: Faker::Food.vegetables, description: 'Vegetables from Europe', price: Faker::Number.decimal(l_digits: 3), image: 'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/slideshows/powerhouse_vegetables_slideshow/650x350_powerhouse_vegetables_slideshow.jpg', category_id: 1, subcategory_id: 1)
  Product.create(title: Faker::Food.vegetables, description: 'Vegetables from Europe', price: Faker::Number.decimal(l_digits: 3), image: 'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/slideshows/powerhouse_vegetables_slideshow/650x350_powerhouse_vegetables_slideshow.jpg', category_id: 2, subcategory_id: 1)

end
