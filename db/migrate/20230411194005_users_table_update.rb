class UsersTableUpdate < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :zip, :string
    add_column :users, :state, :string
  end
end
