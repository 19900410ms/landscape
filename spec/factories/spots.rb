FactoryBot.define do

  factory :spot do
    name            {"test"}
    division_id     {"5"}
    prefecture_id   {"27"}
    address         {"中央区難波5丁目1−60 なんばスカイオ15階"}
    station         {"大阪市営地下鉄御堂筋線なんば駅"}
    introduction    {"TECH::EXPERTなんば校があります"}
    user_id         {"1"}
  end

end