class UserTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :ip_address
  end
end
