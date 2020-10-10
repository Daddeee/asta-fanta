json.extract! user, :id, :name, :credits, :created_at, :updated_at
json.url user_url(user, format: :json)
