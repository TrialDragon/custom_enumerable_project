module Enumerable
  # Your code goes here
  def my_each_with_index
    (0..length - 1).each do |element_index|
      yield self[element_index], element_index if block_given?
    end
    self
  end

  def my_select
    result_array = []
    my_each do |element|
      result_array << element if yield element
    end
    result_array
  end

  def my_all?
    falsey = false
    my_each do |element|
      falsey ||= !(block_given? ? yield(element) : element)
    end
    !falsey
  end

  def my_any?
    any_true = false
    my_each do |element|
      any_true ||= block_given? ? yield(element) : element
      p any_true
    end
    any_true
  end

  def my_none?
    is_true = false
    my_each do |element|
      is_true ||= block_given? ? yield(element) : element
    end
    !is_true
  end

  def my_count
    count = 0
    each do |element|
      if block_given?
        count += 1 if yield element
      else
        count += 1
      end
    end
    count
  end

  def my_map
    results_array = []
    each do |element|
      results_array << yield(element)
    end
    results_array
  end

  def my_inject(initial_value = 0)
    prior = initial_value
    each do |element|
      prior = yield(prior, element) if block_given?
    end
    prior
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    (0..length - 1).each do |element_index|
      yield self[element_index] if block_given?
    end
    self
  end
end
