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
test.set('jacket', 'asd')
test.set('kite', 'asd')
test.set('lion', 'goldsen')
test.set('moon', 'silver')
test.set('lion', 'goldsad')
test.set('moon', 'silvwewer')


puts test.entries
