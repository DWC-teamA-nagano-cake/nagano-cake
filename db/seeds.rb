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
    encrypted_password: "aaa111#{n + 1}",
    address: "日本#{n + 1}",
    telephone_number: "0120000#{n + 1}",
    is_deleted: false,
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

5.times do |n|
  CartItem.create!(
    item_id: n + 1,
    customer_id: 1,
    quantity: 2,
  )
end

5.times do |n|
  Order.create!(
    customer_id: n + 1,
    name: "てすと#{n + 1} 太郎",
    address: "日本#{n + 1}",
    postal_code: "1111111",
    payment_method: 0,
    total_payment: 1000,
    shipping_cost: 800,
    status: 0
  )
end