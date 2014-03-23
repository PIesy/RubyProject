json.array!(@alkohols) do |alkohol|
  json.extract! alkohol, :id, :name, :image_uid, :image_name, :percentage, :volume, :bottle_type
  json.url alkohol_url(alkohol, format: :json)
end
