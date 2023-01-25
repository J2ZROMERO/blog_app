json.extract! user, :id, :Name, :Photo, :Bio, :PostsCounter, :created_at, :updated_at
json.url user_url(user, format: :json)
