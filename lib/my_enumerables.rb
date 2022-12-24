module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end

    return self
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end

    return self
  end

  def my_select
    return_array = Array.new
    i = 0
    while i < self.length
      return_array << self[i] if yield(self[i])
      i += 1
    end

    return return_array
  end

  def my_all?
    i = 0
    while i < self.length
      return false if !yield(self[i])
      i += 1
    end

    return true
  end

  def my_any?
    i = 0
    while i < self.length
      return true if yield(self[i])
      i += 1
    end

    return false
  end

  def my_none?
    i = 0
    while i < self.length
      return false if yield(self[i]) 

      i += 1
    end

    return true
  end

  def my_count
    if block_given?
      counter = 0
      i = 0
      while i < self.length
        counter += 1 if yield(self[i])
        i += 1
      end
      return counter
    else
      return self.length
    end
  end

  def my_map
    return_array = []
    i = 0
    while i < self.length
      block_value = yield(self[i])
      return_array << block_value
      i += 1
    end

    return return_array
  end

end

p [5, 8, 2, 6, 7, 4].my_map(&:to_s)
