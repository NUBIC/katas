def update_quality(items)
  items.each do |item|
    update_item(item)
  end
end

def update_item(item)
  update_sell_in(item)
  update_quality_for(item)
end

def update_quality_for(item)
  case item.name
  when 'Aged Brie'
    delta = item.sell_in <= 0 ? 2 : 1
    item.quality = [50, item.quality + delta].min
  when 'Backstage passes to a TAFKAL80ETC concert'
    if item.sell_in < 0
      item.quality = 0
    else
      delta = if item.sell_in < 5
        3
      elsif item.sell_in < 10
        2
      else
        1
      end
      item.quality = [50, item.quality + delta].min
    end
  when 'Sulfuras, Hand of Ragnaros'
    # noop
  when 'Conjured Mana Cake'
    delta = item.sell_in <= 0 ? -2 : -1
    item.quality = [0, item.quality + (delta * 2)].max
  else
    delta = item.sell_in <= 0 ? -2 : -1
    item.quality = [0, item.quality + delta].max
  end 
end

def update_sell_in(item)
  if item.name != 'Sulfuras, Hand of Ragnaros'
    item.sell_in -= 1
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

