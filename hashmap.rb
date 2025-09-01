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
        new_buckets[get_index(node.key)].append(node.key, node.value)
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

  # #get(key) Toma un argumento como clave y devuelve el valor asignado a esta clave. 
  # Si no se encuentra la clave, devuelve nil.
  
  def get(key)
    @buckets.each do |bucket|
      next if bucket.empty?
      value = bucket.find_key_throw_value(key)
      return value if !value.nil?
    end
    nil
  end

  # #has?(key)toma una clave como argumento y devuelve true 
  # o false en función de si la clave está o no en el mapa hash.
  
  def has?(key)
    @buckets.each do |bucket|
      found = bucket.contains_key?(key)
      return true if found
    end
    false
  end
 
  # #remove(key)Toma una clave como argumento. Si la clave dada está en el mapa hash, debe eliminar 
  # la entrada con esa clave y devolver el valor de la entrada eliminada. Si la clave no está en el mapa hash, 
  # debe devolver nil.
  
  def remove(key)
    if self.has?(key)
      
    else return nil
    end
  end
end