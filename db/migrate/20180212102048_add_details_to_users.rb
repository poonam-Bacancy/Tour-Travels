class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :text
    add_column :users, :gender, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :uname, :string
  end
end
