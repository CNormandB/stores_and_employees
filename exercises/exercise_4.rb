# Exercise 4: Loading a subset of stores
#1. Borrowing and modifying the code from Exercise one, create 3 more stores:
  #- Surrey (annual_revenue of 224000, carries women's apparel only)
  #- Whistler (annual_revenue of 1900000 carries men's apparel only)
  #- Yaletown (annual_revenue of 430000 carries men's and women's apparel)

#2. Using the `where` class method from Active Record, fetch (a collection of) only those stores that carry men's apparel. Assign the results to a variable `@mens_stores`.
#3. Loop through each of these stores and output their name and annual revenue on each line.
#4. Do another fetch but this time load stores that carry women's apparel and are generating less than $1M in annual revenue.

require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
# Create stores
Store.create(name: 'Surrey', annual_revenue: 224000, mens_apparel: false, womens_apparel: true)
Store.create(name: 'Whistler', annual_revenue: 1900000, mens_apparel: true, womens_apparel: false)
Store.create(name: 'Yaletown', annual_revenue: 430000, mens_apparel: true, womens_apparel: true)

#Find stores that sell men's apparel
@mens_stores = Store.where(mens_apparel: true)

#Output names and anual revenue of stores with mens apparel
puts "Men's Apparel Stores:"
@mens_stores.each do |store|
  puts "#{store.name}: Annual Revenue - #{store.annual_revenue}"
end

#Find stores that sell women's apparel with annual revenue under 1Million
@womens_stores_under_1m = Store.where("womens_apparel = ? AND annual_revenue < ?", true, 1000000)
puts "\nWomen's Apparel Stores Generating Less Than $1M in Annual Revenue:"
@womens_stores_under_1m.each do |store|
  puts "#{store.name}: Annual Revenue - #{store.annual_revenue}"
end
