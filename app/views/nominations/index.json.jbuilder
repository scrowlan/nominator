json.array!(@nominations) do |nomination|
  json.extract! nomination, :id
  json.url nomination_url(nomination, format: :json)
end
