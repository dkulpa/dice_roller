CUBES = { k20: 1..20, k30: 1..30}

def draw(cube, quantity)
  if quantity == 1
    Random.new.rand(cube)
  else
    result = []
    quantity.times do
      result << Random.new.rand(cube)
    end
    result
  end
end

rolls_sum = 0
additional_roll = draw(CUBES[:k20], 1)

until rolls_sum > 55 do
  rolls = draw(CUBES[:k20], 7)

  if (1..7).cover?(draw(CUBES[:k30], 1)) && draw(CUBES[:k30], 1) == 1
    filtered_rolls = rolls.sort.drop(2)
  elsif (24..30).cover?(draw(CUBES[:k30], 1))
    additional_roll = 25
  else
    filtered_rolls = rolls.sort.slice(1..-2)
  end

  rolls_sum = filtered_rolls.inject(:+)
end

result = filtered_rolls << additional_roll
p result
