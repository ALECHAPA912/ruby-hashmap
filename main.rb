require "./hashmap.rb"

test = HashMap.new

test.set('apple', 'red') 
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

p test.entries
puts test.length
puts test.capacity


test.set('hat', 'pitito')
p test.entries
puts test.length
puts test.capacity

test.set('moon', 'silver')
p test.entries
puts test.length
puts test.capacity


test.set('ale', 'chapa')
p test.entries
puts test.length
puts test.capacity

