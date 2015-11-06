class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :professional, index: true, foreign_key: true
      t.float :amount

      t.timestamps null: false
    end
  end
end
