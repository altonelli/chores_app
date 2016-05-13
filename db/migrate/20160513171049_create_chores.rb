class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :title
      t.string :details

      t.timestamps null: false
    end
  end
end
