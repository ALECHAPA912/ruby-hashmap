require "./node.rb"

class LinkedList
  def initialize(head = nil, tail = nil)
    @head = head
    @tail = tail
  end

  #append(value) agrega un nuevo nodo que contiene valuehasta el final de la lista
  
  def append(key, value)
    new_node = Node.new(key, value)
    if self.size == 0
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = @tail.next_node
    end
  end

  #prepend(value) agrega un nuevo nodo que contiene valueal inicio de la lista
  
  def prepend(value)
    new_node = Node.new(value)
    if self.size == 0
      @tail = new_node
    else
      new_node = Node.new(value, @head)
    end
    @head = new_node
  end
  
  #size devuelve el número total de nodos en la lista
  
  def size
    current_node = @head
    counter = 0
    while current_node != nil
      counter += 1
      current_node = current_node.next_node
    end
    counter
  end

  #head devuelve el primer nodo de la lista
  
  def head
    @head
  end

  #tail devuelve el último nodo de la lista
  def tail
    @tail
  end

  #at(index) devuelve el nodo en el punto dado index
  
  def at(index)
    current_node = @head
    current_index = 0
    while current_node != nil && index != current_index
      current_index += 1
      current_node = current_node.next_node
    end
    current_node
  end

  #pop elimina el último elemento de la lista
  
  def pop
    return nil if self.size == 0
    if self.size == 1
      @head = @tail = nil
    elsif self.size == 2
      @head.next_node = nil
      @tail = @head
    else
      current_node = @head
      last_node = @head
      while current_node != nil
        if current_node.next_node == nil
          last_node.next_node = nil
          return
        end
        last_node = current_node
        current_node = current_node.next_node
      end
    end
  end

  #contains?(value) devuelve verdadero si el valor pasado está en la lista y de lo contrario devuelve falso.
  
  def contains_value?(value)
    current_node = @head
    while current_node != nil
      return true if current_node.value == value
      current_node = current_node.next_node
    end
    false
  end

  def contains_key?(key)
    current_node = @head
    while current_node != nil
      return true if current_node.key == key
      current_node = current_node.next_node
    end
    false
  end

  #find(value) devuelve el índice del nodo que contiene el valor, o nulo si no se encuentra.
  
  def find_value(value)
    current_node = @head
    current_index = 0
    while current_node != nil && value != current_node.value
      current_index += 1
      current_node = current_node.next_node
    end
    return current_index if current_node.value == value
    nil
  end

  def find_key(key)
    current_node = @head
    current_index = 0
    while current_node != nil && key != current_node.key
      current_index += 1
      current_node = current_node.next_node
    end
    return current_index if current_node.key == key
    nil
  end

  def find_key_throw_value(key)
    current_node = @head
    while current_node != nil
      return current_node.value if current_node.key == key
      current_node = current_node.next_node
    end
    nil
  end

  def change_value(key, value)
    current_node = @head
    while current_node != nil
      if current_node.key == key
        current_node.value = value
        return
      end
      current_node.next_node
    end
  end

  #insert_at(value, index) que inserta un nuevo nodo con el proporcionado valueen el dado index.
  
  def insert_at(index, key, value)
    return if index < 0
    if index == 0
      preppend(key, value)
      return
    end
    if index > (self.size - 1)
      append(key, value)
      return
    end
    current_node = @head
    last_node = @head
    current_index = 0
    while current_node != nil && current_index != index
      last_node = current_node
      current_node = current_node.next_node
      current_index += 1
    end
    new_node = Node.new(value, current_node)
    last_node.next_node = new_node
  end

  #remove_at(index) que elimina el nodo en el dado index.
  
  def remove_at(index)
    return if index < 0 || index > (self.size - 1)
    if index == 0
      @head = @head.next_node
      return
    end
    current_node = @head
    last_node = @head
    current_index = 0
    while current_node != nil && current_index != index
      last_node = current_node
      current_node = current_node.next_node
      current_index += 1
    end
    last_node.next_node = current_node.next_node
    @tail = last_node.next_node if index == (self.size - 1) 
  end

  def all_nodes
    current_node = @head
    nodes_array = []
    while current_node != nil
      nodes_array << current_node
      current_node = current_node.next_node
    end
    nodes_array
  end

  def all_keys
    current_node = @head
    key_array = []
    while current_node != nil
      key_array << current_node.key
      current_node = current_node.next_node
    end
    key_array
  end

  def all_values
    current_node = @head
    values_array = []
    while current_node != nil
      values_array << current_node.value
      current_node = current_node.next_node
    end
    values_array
  end

  def all_entries
    current_node = @head
    entries_array = []
    while current_node != nil
      entries_array << current_node.to_s
      current_node = current_node.next_node
    end
    entries_array
  end

  def empty?
    size == 0
  end

  def remove_key(key)
    current_node = @head
    last_node = @head
    while current_node != nil
      if current_node.key == key
        if @head == current_node
          @head = current_node.next_node
        elsif @tail == current_node
          @tail = last_node
          @tail.next_node = nil
        else
          last_node.next_node = current_node.next_node
        end
        return current_node.value
      end
      last_node = current_node
      current_node = current_node.next_node
    end
    nil
  end

  #to_s Representa tus objetos LinkedList como cadenas, para que puedas imprimirlos y previsualizarlos en la consola. 
  #El formato debería ser:( value ) -> ( value ) -> ( value ) -> nil
  
  def to_s
    string = ""
    current_node = @head
    while current_node != nil
      string += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    string += "nil"
  end
end

