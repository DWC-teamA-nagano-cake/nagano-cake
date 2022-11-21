# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "anpan@anpan.com",
  password: "soreikeanpan"
)

11.times do |n|
  Customer.create!(
    email: "test#{n + 1}@test.com",
    last_name: "太郎#{n + 1}",
    first_name: "てすと#{n + 1}",
    last_name_kana: "タロウ#{n + 1}",
    first_name_kana: "テスト#{n + 1}",
    post_code: "1111111",
    password: "aaa111#{n + 1}",
    address: "日本#{n + 1}",
    phone_number: "0120000#{n + 1}",
    is_deleted: false
  )
end


Genre.create!(
  [
    {
      genre: 'ケーキ',
    },
    {
      genre: '焼き菓子',
    },
    {
      genre: 'プリン',
    },
    {
      genre: 'キャンディ',
    }
  ]
)

# -------------------
4.times do |n|
  product = Product.create!(
    genre_id: n + 1,
    name: 'チーズケーキ',
    description: '新商品！',
    price: 500
  
  )
  product.product_image.attach(io: File.open(Rails.root.join("app/assets/images/cake1.jpg")),
  filename: "cake1.jpg"
  
  )
end






# Product.create!(
#   [
#     {
#       genre_id: 1,
#       name: 'チーズケーキ',
#       description: '新商品！',
#       price: 500,

#       product_image: File.open("./app/assets/images/cake1.jpg")
#     },
#     {
#       genre_id: 2,
#       name: 'クッキー',
#       description: '新商品！',
#       price: 100,
#       product_image: File.open("./app/assets/images/baked_goods1.jpg")
#     },
#     {
#       genre_id: 3,
#       name: 'チーズケーキ',
#       description: '新商品！',
#       price: 500,
#       is_active: true,
#       product_image: File.open("./app/assets/images/cake1.jpg")
#     },
#     {
#       genre_id: 4,
#       name: 'なめらかプリン',
#       description: '新商品！',
#       price: 300,
#       product_image: File.open("./app/assets/images/candy1.jpg")
#     },
#     {
#       genre_id: 5,
#       name: 'キャンディ',
#       description: '新商品！',
#       price: 200,
#       product_image: File.open("./app/assets/images/pudding1.jpg")
#     }
#   ]
#   )

5.times do |n|
  CartItem.create!(
    product_id: n + 1,
    customer_id: n + 1,
    quantity: 2,
  )
end

11.times do |n|
  Order.create!(
    customer_id: n + 1,
    name: "てすと#{n + 1} 太郎",
    address: "日本#{n + 1}",
    post_code: "1111111",
    method_of_payment: 0,
    total_payment: 1000,
    postage: 800,
    order_status: 0
  )
end

4.times do |n|
  OrderDetail.create!(
    product_id: n + 1,
    order_id: n+ 1,
    quantity: 2,
    tax_price: 893,
    making_status: 0
  )
end