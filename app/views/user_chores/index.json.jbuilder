json.array!(@user_chores) do |user_chore|
  json.extract! user_chore, :id, :due_date, :completed
  json.url user_chore_url(user_chore, format: :json)
end
