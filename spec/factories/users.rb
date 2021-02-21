FactoryBot.define do
  factory :user do
    transient do
      japanese_name {Gimei.name}
    end
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(min_alpha: 3, min_numeric: 3, number: 10)}
    password_confirmation {password}
    last_name             {japanese_name.last.kanji}
    first_name            {japanese_name.first.kanji}
    last_name_kana        {japanese_name.last.katakana}
    first_name_kana       {japanese_name.first.katakana}
    birth_date            {Faker::Date.backward}
  end
end
