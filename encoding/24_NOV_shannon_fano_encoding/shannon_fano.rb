def encode(input)
  header = {input => 0}
  body = '0'
  {:header => header,
   :body => body}
end

def tokenize(input)
  hash_for_each_digit = Hash.new(0)  

  input.chars.each do |char|
    hash_for_each_digit[char] += 1
  end

  hash_for_each_digit.to_a.sort do |a, b| b[1] <=> a[1] end
end

def make_tree(tokens)
  if tokens.size == 1
    return [tokens[0][0],'0']
  else
    return make_tree2(tokens)
  end
end

def make_tree2(tokens, prefix='')
  if tokens.size == 1
    return [tokens[0][0],prefix]
  end
  left,right = split_tokens(tokens)
  {:left => make_tree2(left, prefix+'0'),
   :right => make_tree2(right, prefix+'1')}
end

def split_tokens(tokens)
  sum = tokens.inject(0) {|total, e| total + e[1]}
  middle = sum / 2
  left = []
  right = []

  i = 0
  tokens.each do |symbol, weight|
    if i < middle
      left << [symbol, weight] 
    else
      right << [symbol, weight] 
    end
    i += weight
  end
  [left,right]
end  