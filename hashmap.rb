require "./linked_list.rb"

class HashMap
  def initialize()
    @capacity = 16
    @load_factor = 0.75
    @buckets = Array.new(@capacity) {LinkedList.new}
    @size = 0 
  end

  def capacity
    @capacity
  end

  def grow_buckets
    @capacity *= 2 
    old_buckets = @buckets
    @buckets = Array.new(@capacity) {LinkedList.new}
    old_buckets.each do |bucket|
      next if bucket.empty?
      bucket.all_nodes.each do |node|
        set(node.key, node.value)
      end
    end
  end

  def get_index(key)
    hash(key) % @capacity
  end

  def hash(key)
   hash_code = 0
   prime_number = 31
   key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
   hash_code.abs
  end

  def set(key, value)
    index = get_index(key)
    if @buckets[index].contains_key?(key)
      @buckets[index].change_value(key, value)
    else
      @buckets[index].append(key, value)
    end
    if self.length >= (@capacity * @load_factor)
      grow_buckets
    end
  end

  # #get(key) Toma un argumento como clave y devuelve el valor asignado a esta clave. 
  # Si no se encuentra la clave, devuelve nil.
  
  def get(key)
    index = get_index(key)
    @buckets[index].find_key_throw_value(key)
  end

  # #has?(key)toma una clave como argumento y devuelve true 
  # o false en función de si la clave está o no en el mapa hash.
  
  def has?(key)
    index = get_index(key)
    @buckets[index].contains_key?(key)
  end
 
  # #remove(key) Toma una clave como argumento. Si la clave dada está en el mapa hash, debe eliminar 
  # la entrada con esa clave y devolver el valor de la entrada eliminada. Si la clave no está en el mapa hash, 
  # debe devolver nil.
  
  def remove(key)
    index = get_index(key)
    @buckets[index].remove_key(key)
  end

  #length devuelve el número de claves almacenadas en el mapa hash.
  
  def length
    count = 0
    @buckets.each do |bucket|
      next if bucket.empty?
      count += bucket.size
    end
    count
  end

  #clear elimina todas las entradas en el mapa hash.

  def clear
    @capacity = 16
    @buckets = Array.new(@capacity) {LinkedList.new}
    @size = 0
  end

  #keys devuelve una matriz que contiene todas las claves dentro del mapa hash.
  
  def keys
    key_array = []
    @buckets.each do |bucket|
      key_array.concat(bucket.all_keys)
    end
    key_array
  end

  #values devuelve una matriz que contiene todos los valores.
  
  def values
    values_array = []
    @buckets.each do |bucket|
      values_array.concat(bucket.all_values)
    end
    values_array
  end

  #entries Devuelve una matriz que contiene cada key, valuepar. Ejemplo:[[first_key, first_value], [second_key, second_value]]
  
  def entries
    entries_array = []
    @buckets.each do |bucket|
      entries_array.concat(bucket.all_entries)
    end
    entries_array
  end
end