def first_anagram?(source, target)  # O(n!)
  source.chars
    .permutation(source.length).to_a
      .map(&:join)
        .include?(target)
end

# p first_anagram?("elvis")
# p first_anagram?("elvis", "elvis")

def second_anagram?(source, target) # O(x^2)
  source_chars = source.chars
  target_chars = target.chars
  source_chars.each_index do |idx|
    target_idx = target_chars.index(source_chars[idx])
    if target_idx
      source_chars.delete_at(idx)
      target_chars
        .delete_at(target_idx)
    else
      return false  
    end
  end
  source_chars == target_chars
end

# p second_anagram?("elvis", "plives")


def third_anagram?(source, target)  # O(nlogn)
  source.chars.sort == target.chars.sort
end

# p third_anagram?("elvis", "lives")

def fouth_anagram?(source, target)  # O(n)
  counter_h = Hash.new(0)
  source.each_char do |ch|
    counter_h[ch] += 1
  end

  target.each_char do |ch|
    counter_h[ch] -= 1
  end

  counter_h.values.all? {|v| v == 0}
end

p fouth_anagram?("elvis", "lives")
