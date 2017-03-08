def draw(rolls, quantity)
  quantity.times do
    rolls << Random.new.rand(1..20)
  end
end

rolls = []
rolls_sum = 0

until rolls_sum > 55 do
  rolls.clear
  draw(rolls, 7)
  filtered_rolls = rolls.sort.slice(1..-2)
  rolls_sum = filtered_rolls.inject(:+)
end

draw(filtered_rolls, 1)

result = filtered_rolls
p result
