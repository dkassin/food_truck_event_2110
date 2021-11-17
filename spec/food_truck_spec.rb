require './lib/item'
require './lib/food_truck'
describe FoodTruck do
  it 'exists' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_a FoodTruck
    expect(food_truck.name).to eq ("Rocky Mountain Pies")
    expect(food_truck.inventory).to eq ({})
  end

  it 'Can show the stock of an item'  do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.check_stock(item1)).to eq 0

    food_truck.stock(item1, 30)

    expect(food_truck.check_stock(item1)).to eq 30

  end

  it 'Can stock an item'  do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    food_truck.stock(item1, 30)
    expected = {item1 => 30}

    expect(food_truck.inventory).to eq (expected)
  end
end
