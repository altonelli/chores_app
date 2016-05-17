class CreateUnitUsers < ActiveRecord::Migration
  def change
    create_table :unit_users do |t|
      t.string :state
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :unit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
