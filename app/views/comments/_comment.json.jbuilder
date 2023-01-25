json.extract! comment, :id, :AuthorId, :PostId, :Text, :created_at, :updated_at
json.url comment_url(comment, format: :json)
