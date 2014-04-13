json.array!(@events) do |event|
  json.extract! event, :event_date, :description, :quisine, :suggested_donation, :max_participants
  json.url event_url(event, format: :json)
end