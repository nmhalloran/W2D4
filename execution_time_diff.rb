list_arr = (0..10000).to_a.shuffle
def slow_min(list_arr)

  sorted = false
  until sorted
    sorted = true

    (0...list_arr.length - 1).each do |idx|
      if list_arr[idx] > list_arr[idx + 1]
        list_arr[idx], list_arr[idx  +1] = list_arr[idx + 1], list_arr[idx]
        sorted = false
      end
    end
  end

  return list_arr.first
end

def fast_min(list_arr)
  min = list_arr.first

  list_arr.each do |el|
    min = el if el < min
  end

  min
end
  start_time = Time.now
  fast_min(list_arr)
  end_time = Time.now

  end_time - start_time


# list = [2, 3, -6, 7, -6, 7]
# list = [-5, -1, -3]
list = (-400000..1200000).to_a.shuffle

def slow_sum(list)
  new_array = []

  (0...list.length - 1).each do |idx1|
    (idx1 + 1...list.length).each do |idx2|
      new_array << list[idx1..idx2].reduce(:+)
    end
  end
  new_array.max
end

def fast_sum(list)
  idx1 = 0
  idx2 = (list.length - 1)
  longest_sum = list.reduce(:+)
  current_sum = longest_sum

  while idx1 < idx2
    if list[idx1] <= list[idx2]
      current_sum -= list[idx1]
      idx1 += 1
    else
      current_sum -= list[idx2]
      idx2 -= 1
    end
    longest_sum = current_sum > longest_sum ? current_sum : longest_sum
  end

    longest_sum
end

def largest_contiguous_subsum2(arr)
  largest = arr.first
  current = arr.first

  return arr.max if arr.all? { |num| num < 0 }

  (1...arr.length).each do |i|
    current = 0 if current < 0
    current += arr[i]
    largest = current if current > largest
  end

  largest
end

start_time = Time.now
p fast_sum(list)
end_time = Time.now

p "fast: #{end_time - start_time}"

start_time = Time.now
p largest_contiguous_subsum2(list)
end_time = Time.now

p "solution: #{end_time - start_time}"


# start_time = Time.now
# p slow_sum(list)
# end_time = Time.now
#
# p "slow: #{end_time - start_time}"
