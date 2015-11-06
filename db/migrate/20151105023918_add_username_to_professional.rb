class AddUsernameToProfessional < ActiveRecord::Migration
  def change
    add_column :professionals, :username, :string
  end
end
