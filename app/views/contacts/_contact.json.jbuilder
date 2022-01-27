json.extract! contact, :id, :name, :born_date, :user_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
