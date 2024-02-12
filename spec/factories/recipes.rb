FactoryBot.define do
  factory :recipe do
    title { 'Borscht' }
    cook_time { 140 }
    prep_time { 30 }
    ingredients do
      "3 litres cold water; 600g pork ribs; 1 onion; 2 bay leaves; 5 peppercorns; 1 tsp salt; 2 medium beets;\
3 medium potatoes; 2 medium carrots; 2 cloves of garlic; 3 tbsp tomato puree/paste; 1/2 small white cabbage;\
salt; pepper"
    end
    ratings { 5.0 }
    category { 'Soup' }
    author { 'John Doe' }
    image { 'https://cdn.apartmenttherapy.info/image/upload/f_jpg,q_auto:eco,c_fill,g_auto,w_1500,ar_1:1/k%2FPhoto%2FRecipes%2F2023-10-borscht%2Fborscht-035' }
  end
end
