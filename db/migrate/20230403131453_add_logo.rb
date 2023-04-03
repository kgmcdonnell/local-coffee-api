class AddLogo < ActiveRecord::Migration[7.0]
  def change
    add_column :coffee_shops, :logo, :string
  end
end
