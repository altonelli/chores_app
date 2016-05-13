class AddUserChoresToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :user_chore, index: true, foreign_key: true
  end
end
