FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'aaa111' }
    password_confirmation { password }
    first_name            { '漢カな' }
    last_name             { '字キに' }
    first_name_kana       { 'カンカナ' }
    last_name_kana        { 'ジキニ' }
    birthday              { '1993-02-24' }
  end
end
