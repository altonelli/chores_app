class AddUsersToUserChores < ActiveRecord::Migration
  def change
    add_reference :user_chores, :user, index: true, foreign_key: true
  end
end
