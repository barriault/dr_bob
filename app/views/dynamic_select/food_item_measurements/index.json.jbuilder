json.array!(@measurements) do |measurement|
  json.extract! measurement, :id, :name
end