
 merchant1 = Merchant.create!(name: 'Hair Care')

 item_1 = Item.create!(name: "Shampoo", description: "This washes your hair", unit_price: 10, merchant_id: merchant1.id, status: 1)
 item_2 = Item.create!(name: "Conditioner", description: "This makes your hair shiny", unit_price: 8, merchant_id: merchant1.id)
 item_3 = Item.create!(name: "Brush", description: "This takes out tangles", unit_price: 5, merchant_id: merchant1.id)
 item_4 = Item.create!(name: "Hair tie", description: "This holds up your hair", unit_price: 1, merchant_id: merchant1.id)
 item_7 = Item.create!(name: "Scrunchie", description: "This holds up your hair but is bigger", unit_price: 3, merchant_id: merchant1.id)
 item_8 = Item.create!(name: "Butterfly Clip", description: "This holds up your hair but in a clip", unit_price: 5, merchant_id: merchant1.id)

 bulk_discount_1 = merchant1.bulk_discounts.create!(percentage_discount: 15, quantity_threshold: 3)
 bulk_discount_2 = merchant1.bulk_discounts.create!(percentage_discount: 25, quantity_threshold: 5)
 bulk_discount_3 = merchant1.bulk_discounts.create!(percentage_discount: 50, quantity_threshold: 10)