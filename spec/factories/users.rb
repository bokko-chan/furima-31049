FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    # '1a' + を追記すると半角英数字の組み合わせでランダム生成するようにできる
    password_confirmation {password}
    family_name           {'山田'}
    first_name            {'花子'}
    family_name_kana      {'ヤマダ'}
    first_name_kana       {'ハナコ'}
    # first_name_kana      {'ハナコ'} Gimei使用せず任意の文字列だと簡単に出来る!
    birthday              {Faker::Date.birthday(min_age: 5, max_age: 90)}
  end
end
