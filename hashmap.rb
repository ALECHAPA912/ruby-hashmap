require "./linked_list.rb"

class HashMap
  def initialize
    @load_factor = 0.75
    @capacity = 16
    @buckets = Array.new(@capacity) { LinkedList.new }
  end

  def buckets
    @buckets
  end
  
  def hash(key)
    hash_code = 0
    prime_number = 31  
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord } 
    hash_code
  end

  def get_hash_index(hash)
    hash % @capacity
  end

  def grow_buckets
    return unless length > (@capacity * @load_factor)
    old_buckets = @buckets
    @capacity *= 2
    @buckets = Array.new(@capacity) { LinkedList.new }
  
    old_buckets.each do |bucket|
      bucket.get_pairs.each do |key, value|
        set(key, value)
      end
    end
  end
  
  def set(key, value)
    index = get_hash_index(hash(key))
    raise IndexError if index.negative? || index >= @buckets.length
    if @buckets[index].contains_key?(key)
      @buckets[index].replace_value(key, value)
    else
      @buckets[index].append(key, value)
      grow_buckets
    end
  end

  def get(key)
    index = get_hash_index(hash(key))
    raise IndexError if index.negative? || index >= @buckets.length
    @buckets[index].find_key(key)
  end

  def has?(key)
    index = get_hash_index(hash(key))
    raise IndexError if index.negative? || index >= @buckets.length
    @buckets[index].contains_key?(key)
  end

  def remove(key)
    index = get_hash_index(hash(key))
    raise IndexError if index.negative? || index >= @buckets.length
    @buckets[index].remove_key(key)
  end
  
  def length
    acum = 0
    @buckets.each do |bucket|
      acum += bucket.size
    end
    acum
  end

  def clear
    @buckets = Array.new(@capacity) { LinkedList.new }
  end

  def keys
    keys = []
    @buckets.each do |bucket|
      keys.concat(bucket.get_keys) 
    end
    keys
  end

  def values
    values = []
    @buckets.each do |bucket|
      values.concat(bucket.get_values) 
    end
    values
  end

  def entries
    pairs = []
    @buckets.each do |bucket|
      pairs.concat(bucket.get_pairs) 
    end
    pairs
  end

  def to_s
    counter = 0
    @buckets.each do |bucket|
      puts "BUCKET #{counter}: " + bucket.to_s
      counter += 1
    end
  end
end