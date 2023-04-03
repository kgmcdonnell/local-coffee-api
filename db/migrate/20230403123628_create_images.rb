class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :url
      t.integer :coffee_shop_id

      t.timestamps
    end
  end
end
