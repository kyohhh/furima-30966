FactoryBot.define do
  factory :user do
    nickname                        { Faker::Name.name }
    email                           { Faker::Internet.email }
    password                        { 'aaa111' }
    password_confirmation           { password }
    family_name                     { 'ぜんかく' }
    first_name                      { 'ぜんかく' }
    family_name_kana                { 'ゼンカクカナ' }
    first_name_kana                 { 'ゼンカクカナ' }
    birthday                        { '2021-01-01' }
  end
end
