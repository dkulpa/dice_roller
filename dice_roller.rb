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

until rolls_sum > 55 do
  rolls = draw(CUBES[:k20], 7)

  if (1..7).cover?(draw(CUBES[:k30], 1)) && draw(CUBES[:k30], 1) == 1
    filtered_rolls = rolls.sort.drop(2)
  else
    filtered_rolls = rolls.sort.slice(1..-2)
  end

  rolls_sum = filtered_rolls.inject(:+)
end

result = filtered_rolls << draw(CUBES[:k20], 1)
p result
