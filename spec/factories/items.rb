FactoryBot.define do
  factory :item do
    name                {"ハンチョウ全巻"}
    introduction        {"漫画『ハンチョウ』全巻です"}
    item_condition      { 2 }
    postage_payer       { 2 }
    prefecture          { 1 }
    preparation_period  { 1 }
    price               { 5000 }
    after(:build) do |item|
      item.images << build(:image)
      category = create(:category)
      item.category_id = category.id
    
    end
  end
  # categoryがnilの場合
  factory :item2, class: Item do
    name                {"ハンチョウ全巻"}
    introduction        {"漫画『ハンチョウ』全巻です"}
    item_condition      { 2 }
    postage_payer       { 2 }
    prefecture          { 1 }
    preparation_period  { 1 }
    price               { 5000 }
    after(:build) do |item|
      item.images << build(:image)
    
    end
  end
end
