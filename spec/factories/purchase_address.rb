FactoryBot.define do
  factory :purchase_address do
    telephone_number { '00000000000' }
    post_code { '111-1111' }
    municipality { '品川区' }
    house_number { '品川ビルA1' }
    prefecture_id { '2' }
    token {"tok_abcdefghijk00000000000000000"}

  end
end