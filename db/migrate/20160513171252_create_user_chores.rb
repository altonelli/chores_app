class CreateUserChores < ActiveRecord::Migration
  def change
    create_table :user_chores do |t|
      t.datetime :due_date
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
