class CreateProfessionals < ActiveRecord::Migration
  def change
    create_table :professionals do |t|
      t.string :name
      t.string :email
      t.string :job_location
      t.string :job_title
      t.string :phone_number
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
