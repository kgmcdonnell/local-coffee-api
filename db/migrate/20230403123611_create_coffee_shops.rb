class CreateCoffeeShops < ActiveRecord::Migration[7.0]
  def change
    create_table :coffee_shops do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :address
      t.string :number

      t.timestamps
    end
  end
end
