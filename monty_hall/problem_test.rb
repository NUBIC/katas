GAMES = 500000
DOORS = [1, 2, 3]
stay_win_counter = switch_win_counter = 0

def choice(arr)
  arr[rand(arr.length)]
end

puts "Playing #{GAMES} games..."
GAMES.times {
  prize_door  = choice(DOORS)
  chosen_door = choice(DOORS)
  opened_door = choice(DOORS - [prize_door, chosen_door])
  switch_door = choice(DOORS - [chosen_door, opened_door])
  stay_win_counter   += 1 if chosen_door == prize_door
  switch_win_counter += 1 if switch_door == prize_door
}

puts "A \"stay\" strategy wins #{(stay_win_counter.to_f / GAMES) * 100} percent of the time."
puts "A \"switch\" strategy wins #{(switch_win_counter.to_f / GAMES) * 100} percent of the time."