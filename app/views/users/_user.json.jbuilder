json.extract! user, :id, :name_email_combi, :created_at, :updated_at
json.url user_url(user, format: :json)