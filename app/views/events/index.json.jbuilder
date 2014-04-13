json.array!(@events) do |event|
  json.extract! event, :event_date, :event_address1, :event_address2, :event_city, :event_zip, :description, :quisine, :suggested_donation, :max_participants
  json.url event_url(event, format: :json)
end