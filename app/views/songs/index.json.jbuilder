json.array!(@songs) do |song|
  json.extract! song, :id, :title, :url_alias, :text, :artist_id
  json.url song_url(song, format: :json)
end
