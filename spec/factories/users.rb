FactoryBot.define do
  factory :user do


nickname {'太朗'}
email {Faker::Internet.email} 
password {'a111111'}
password_confirmation {'a111111'}
family_name {'山田'}
first_name {'太朗'}
family_name_yomi {'ヤマダ'}
first_name_yomi {'タロウ'} 
date_of_birth {Faker::Date.birthday}
  end
end