class CreateProRatings < ActiveRecord::Migration
  def change
    create_table :pro_ratings do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :professional, index: true, foreign_key: true
      t.integer :score

      t.timestamps null: false
    end
  end
end
