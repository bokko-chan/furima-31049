FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {Gimei.last.kanji}
    first_name            {Gimei.first.kanji}
    family_name_kana      {Gimei.last.katakana}
    first_name_kana       {Gimei.first.katakana}
    # first_name_kana      {'ハナコ'} Gimei使用せず任意の文字列だと簡単に出来る!
    birthday              {Faker::Date.birthday(min_age: 5, max_age: 90)}
  end
end
