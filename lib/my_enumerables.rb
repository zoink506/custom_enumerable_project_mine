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

end

p [1, 2, 3, 4].my_all? { |value| value < 5 }

