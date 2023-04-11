class DropCoffeeShops < ActiveRecord::Migration[7.0]
  def change
    drop_table :coffee_shops
  end
end
