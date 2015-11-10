class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :professional, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
