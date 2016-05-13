class AddChoresToUserChores < ActiveRecord::Migration
  def change
    add_reference :user_chores, :chore, index: true, foreign_key: true
  end
end
