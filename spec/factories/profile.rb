FactoryBot.define do

  factory :profile do
    # nickname                     {"abe"}
    # email                        {"kkk@gmail.com"}
    # password                     {"00000000"}
    # password_confirmation        {"00000000"}
    family_name                    {"井出"}
    first_name                     {"智"}
    family_name_kana               {"いで"}
    first_name_kana                {"さとし"}
    birth_day                      {"1989-04-08"}
    destination_family_name        {"井出"}
    destination_first_name         {"智"}
    destination_family_name_kana   {"いで"}
    destination_first_name_kana    {"さとし"}
    post_code                      {"1209999"}
    prefecture                     {"東京都"}
    city                           {"豊島区"}
    house_number                   {"3丁目２番"}

  end

end