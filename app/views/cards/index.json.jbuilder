json.array!(@cards) do |card|
  json.extract! card, :id, :product, :name, :kana, :num, :rarity, :image
  json.url card_url(card, format: :json)
end
