module AlkoholsHelper
  def get_bottle_image(alkohol)
    type = alkohol.bottle_type.present? ? alkohol.bottle_type : 1
    url =  type.to_s + '.jpg'
  end

  def alcohol_bottle_choices
    options_for_select([['Beer bottle', 1], ['Byrlo bottle', 2],
                        ['Cognac bottle', 3], ['Rum bottle', 4],
                        ['Vine bottle', 5], ['Vodka bottle', 6],
                        ['Whiskey bottle',7]])
  end

  def alcohol_type_choices
    options_for_select([['Beer', 'Beer'], ['Byrlo', 'Byrlo'],
                        ['Cognac', 'Cognac'], ['Rum', 'Rum'],
                        ['Vine', 'Vine'], ['Vodka', 'Vodka'],
                        ['Whiskey','Whiskey']])
  end
end
