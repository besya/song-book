json.array!(@artists) do |artist|
  json.extract! artist, :id, :title, :url_alias
  json.url artist_url(artist, format: :json)
end
