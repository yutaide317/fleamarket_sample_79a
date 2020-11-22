FactoryBot.define do
  factory :category do
    name { "パーカー" }
    ancestry { nil }
    
    factory :children_category, parent: :category do
      create { :category }

      factory :grand_category, parent: :children_category do
        create { :children_category }
      end

    end 

  end
end
