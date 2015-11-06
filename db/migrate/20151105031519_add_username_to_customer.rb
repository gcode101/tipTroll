class AddUsernameToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :username, :string
  end
end
