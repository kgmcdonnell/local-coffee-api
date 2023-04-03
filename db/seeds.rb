puts "Seeding..."
coffee_shops = CoffeeShop.create([
  { name: "Apocalypse Coffee Roasters", city: "Melbourne", state: "FL", address: "454 N Harbor City Blvd", number: "(321) 254-3792" },
  { name: "Indialantic Coffee", city: "FL", state: "Indialantic", address: "121 5th Ave" },
  { name: "Anaya Coffee", city: "Melbourne", state: "FL", address: "1414 Highland Ave", number: "(321) 428-3860" },
])

images = Image.create([
  { url: "https://lh3.googleusercontent.com/p/AF1QipM1M6WaoOxhSTRju1vfp8YvR42dZa7IdTNx7f8l=s1360-w1360-h1020", coffee_shop_id: 1 },
  { url: "https://lh3.googleusercontent.com/p/AF1QipPFQ-Y0G3SHHLHh8epNR6wLVZAgISAkrE1OJMwo=s1360-w1360-h1020", coffee_shop_id: 1 },
  { url: "https://lh3.googleusercontent.com/p/AF1QipPefjMEKz8xdu2T1GbZY_Vc2ag0praMKXjWbVoh=s1360-w1360-h1020", coffee_shop_id: 2 },
  { url: "https://lh3.googleusercontent.com/p/AF1QipNsKZ51sIAe7enwyq92gDQBXAiU3UxsGr6nypMd=s1360-w1360-h1020", coffee_shop_id: 3 },
  { url: "https://lh3.googleusercontent.com/p/AF1QipPKo2_NHvh9u5Id1dw3eB629Y7ISs4fchPj7W1u=s1360-w1360-h1020", coffee_shop_id: 3 },
])

puts "...Done!"
