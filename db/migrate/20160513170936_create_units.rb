class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.string :address
      t.string :landlord_name
      t.string :landlord_phone
      t.string :landlord_email

      t.timestamps null: false
    end
  end
end
