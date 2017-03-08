rolls = []

7.times do
  rolls << Random.new.rand(1..20)
end

result = rolls.sort.slice(1..-2)
p result
