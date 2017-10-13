def my_minI(arr) #O(x^2)  Quadratic
  smallest = arr.first
  arr.each do |first|
    arr.each do |second|
      next if first == second
      smaller = [first, second].min
      smallest = smaller if smaller < smallest
    end
  end
  smallest
end

# p my_minI([0, 3, 5, 4, -5, 10, 1, 90])

def my_minII(arr) # O(n)  linear
  arr.reduce {|acc, num| num < acc ? num : acc}
end

# p [1,2,3].map {|el| 10}

# p my_minII([0, -1, 5, 4, -5, 10, 1, 90])

def sub_sumsI(arr)  #O(n^2) Quadratic
  result = []
  arr.each_index do |i|
    arr.each_index do |j|
      result << arr[i..j] unless arr[i..j].empty?
    end
  end
  result.count
  #map {|subarr| subarr.reduce(:+)}.max
end

# p sub_sumsI([5, 3, -7])
# p sub_sumsI([2, 3, -6, 7, -6])
# p sub_sumsI((1..1000).to_a)
# p sub_sumsI([-5, -1, -3])

def sub_sumsII(arr)
  # counter = 0
  result_sum = nil
  (0...arr.length).each do |i|
    # counter += 1
    result_sum = arr[i] if result_sum.nil? || arr[i] > result_sum
    next if i + 1 == arr.length
    (i+1...arr.length).each do |j|
      # counter += 1
      current_sum = arr[i..j].reduce(:+)
      result_sum = current_sum if result_sum.nil? || current_sum > result_sum
      # break if result_sum == arr.reduce(:+)
    end
  end
  # p "counter: #{counter}"
  result_sum
end

def sub_sumsIII(arr)
  return arr.max if arr.all? {|el| el < 0 }

  largest = 0
  current = 0

  arr.each do |num|
    current += num
    if current > largest
      largest = current
    elsif current < 0
      current = 0
    end
  end
  largest
end

# p sub_sumsII([5, 3, -7])
# p sub_sumsII([-5, -1, -3])
# p sub_sumsII((1..100).to_a)
p sub_sumsII([2, 3, -6, 7, -6, 7])
