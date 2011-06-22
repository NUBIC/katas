def chain_h(from, to, words, acc)
  return acc if from == to

  hamming_1 = words.select { |w| hamming(from, w) == 1 }

  return acc + [:unresolvable] if hamming_1.length == 0

  hamming_d = hamming_1.map { |w| [w, hamming(to, w)] }

  next_word, _ = hamming_d.min_by { |_, d| d }

  chain_h(next_word, to, words.reject { |w| w == next_word }, acc << next_word)
end

def chain(from, to, dict)
  raise 'Words must be the same length' if from.length != to.length

  chain_h(from, to, dict[from.length] - [from], [from])
end

def hamming(a, b)
  ct = 0

  for i in (0...a.length)
    ct += 1 if a[i] != b[i]
  end

  ct
end

def dict
  File.read(File.expand_path("../words.txt", __FILE__)).split("\n").map(&:downcase).inject({}) do |r, w|
    unless r.has_key?(w.length)
      r[w.length] = []
    end

    r[w.length] << w
    r
  end
end

w1 = ARGV[0]
w2 = ARGV[1]

puts chain(w1, w2, dict).inspect
