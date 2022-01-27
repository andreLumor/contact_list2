json.extract! phone, :id, :number, :segment_phone, :default_phone, :contact_id, :created_at, :updated_at
json.url phone_url(phone, format: :json)
