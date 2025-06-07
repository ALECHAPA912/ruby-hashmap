require "./node.rb"

class LinkedList
  def initialize
    @first_node = nil
    @last_node = nil
  end

  def append(key, value)
    new_node = Node.new(key, value)
    if @first_node == nil
      @first_node = new_node
    else
      @last_node.next_node = new_node
    end
    @last_node = new_node
  end

  def prepend(key, value)
    new_node = Node.new(key, value)
    if @first_node == nil
      @first_node = new_node
      @last_node = new_node
    else
      @first_node = Node.new(key, value, @first_node)
    end
  end

  def size
    counter = 0
    current_node = @first_node
    while current_node != nil
      counter += 1
      current_node = current_node.next_node
    end
    counter
  end

  def head
    @first_node.value
  end

  def tail
    @last_node.value
  end

  def at(index)
    counter = 0
    current_node = @first_node
    while index > counter
      current_node = current_node.next_node
      counter += 1
    end
    current_node.value
  end

  def pop
    current_node = @first_node
    while current_node.next_node != nil
      previous_node = current_node
      current_node = current_node.next_node
    end
    previous_node.next_node = nil
    @last_node = previous_node
  end

  def contains_value?(value)
    current_node = @first_node
    while current_node != nil
      return true if value == current_node.value
      current_node = current_node.next_node
    end
    false
  end

  def contains_key?(key)
    current_node = @first_node
    while current_node != nil
      return true if key == current_node.key
      current_node = current_node.next_node
    end
    false
  end

  def replace_value(key, new_value)
    current_node = @first_node
    while current_node != nil
      if key == current_node.key
        current_node.value = new_value
        return
      end
      current_node = current_node.next_node
    end
  end

  def find(value)
    current_node = @first_node
    counter = 0
    while current_node != nil
      return counter if value == current_node.value
      current_node = current_node.next_node
      counter += 1
    end
    nil
  end

  def find_key(key)
    current_node = @first_node
    while current_node != nil
      return current_node.value if key == current_node.key
      current_node = current_node.next_node
    end
    nil
  end

  def to_s
    string = ""
    current_node = @first_node
    while current_node != nil
      string += current_node.to_s
      current_node = current_node.next_node
    end
    string
  end

  def insert_at(value, index)
    current_node = @first_node
    previous_node = nil
    counter = 0
    while index > counter
      previous_node = current_node
      current_node = current_node.next_node
      counter += 1
    end
    new_node = Node.new(value, current_node)
    if previous_node == nil
      @first_node = new_node
    else
      previous_node.next_node = new_node
    end
  end

  def remove_at(index)
    current_node = @first_node
    previous_node = nil
    counter = 0
    while index > counter
      previous_node = current_node
      current_node = current_node.next_node
      counter += 1
    end
    if previous_node == nil
      @first_node = current_node.next_node
    else
      previous_node.next_node = current_node.next_node
    end
  end

  def remove_key(key)
    return nil if !contains_key?(key) 
    current_node = @first_node
    previous_node = nil
    while key != current_node.key
      previous_node = current_node
      current_node = current_node.next_node
      counter += 1
    end
    if previous_node == nil
      @first_node = current_node.next_node
    else
      previous_node.next_node = current_node.next_node
    end
    current_node.value
  end

  def get_keys
    current_node = @first_node
    keys = []
    while current_node != nil
      keys << current_node.key
      current_node = current_node.next_node
    end
    keys
  end

  def get_values
    current_node = @first_node
    values = []
    while current_node != nil
      values << current_node.value
      current_node = current_node.next_node
    end
    values
  end

  def get_pairs
    current_node = @first_node
    pairs = []
    while current_node != nil
      pairs << current_node.to_s
      current_node = current_node.next_node
    end
    pairs
  end

  def to_s
    "PRIMER NODO: #{@first_node}, ULTIMO NODO: #{@last_node}"
  end
end