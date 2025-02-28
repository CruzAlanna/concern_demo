# Order.create!(item_name: "Laptop", cancelled: false)
# Order.create!(item_name: "Headphones", cancelled: true)

# Subscription.create!(plan_name: "Monthly", cancelled: false)
# Subscription.create!(plan_name: "Yearly", cancelled: true)

# puts "Seeded #{Order.count} orders and #{Subscription.count} subscriptions."

puts "Creating Orders..."

Order.create!(item_name: "Sample Order 1", cancelled: false)
Order.create!(item_name: "Sample Order 2", cancelled: true)
Order.create!(item_name: "Sample Order 3", cancelled: false)
Order.create!(item_name: "Sample Order 4", cancelled: true)

puts "Seeded #{Order.count} orders."

puts "Creating Subscriptions..."

Subscription.create!(plan_name: "Sample Subscription 1", cancelled: false)
Subscription.create!(plan_name: "Sample Subscription 2", cancelled: true)
Subscription.create!(plan_name: "Sample Subscription 3", cancelled: false)
Subscription.create!(plan_name: "Sample Subscription 4", cancelled: true)

puts "Seeded #{Subscription.count} subscriptions."