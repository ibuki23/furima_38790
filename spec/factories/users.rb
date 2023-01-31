FactoryBot.define do
  factory :user do
   nickname              {Faker::Name.initials(number: 2)}
   email                 {Faker::Internet.free_email}
   password              {Faker::Internet.password(min_length: 6)}
   password_confirmation {password}
   birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
   transient do
   person { Gimei.name }
   end
   family_name           { person.last.kanji }
   first_name            { person.first.kanji }
   family_name_furigana  { person.last.katakana }
   first_name_furigana   { person.first.katakana }
   end
  end
