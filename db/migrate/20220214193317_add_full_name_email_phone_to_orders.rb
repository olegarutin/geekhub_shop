class AddFullNameEmailPhoneToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :full_name, :string
    add_column :orders, :email, :string
    add_column :orders, :phone, :string
  end
end
