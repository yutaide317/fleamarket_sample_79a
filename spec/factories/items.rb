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
      item.images << build(:image, item: item)

      parent = create(:category, name: "親", parent_id: nil)
      child = create(:category, name: "子", parent_id: parent.id)
      grand_child = create(:category, name: "孫", parent_id: child.id)
      item.category_id = grand_child.id
    end
  end
end
