json.array!(@chores) do |chore|
  json.extract! chore, :id, :title, :details
  json.url chore_url(chore, format: :json)
end
