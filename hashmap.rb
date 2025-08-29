require "./linked_list.rb"

class HashMap
  def initialize(capacity=16)
    @capacity = capacity
    @load_factor = 0.8
    @buckets = Array.new(@capacity) {LinkedList.new}
    @count = 0
  end

  def grow_buckets
    new_capacity = @capacity * 2
    new_buckets = Array.new(new_capacity) {LinkedList.new}
    
    @buckets.each do |bucket|
      next if bucket.empty?
      bucket.all_nodes.each do |node|
        set(node.key, node.value, new_buckets)
      end
    end

    @buckets = new_buckets
    @capacity = new_capacity
  end

  def get_index(key)
    hash(key) % @capacity
  end

  def hash(key)
   hash_code = 0
   prime_number = 31
      
   key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
      
   hash_code
  end

  def set(key, value, buckets = @buckets)
    grow_buckets if @capacity * @load_factor < @count
      
    index = get_index(key)
    bucket = buckets[index]
    
    if bucket.contains_key?(key)
      bucket.change_value(key, value)
    else
      bucket.append(key, value)
    end
    
    @count += 1
  end
end