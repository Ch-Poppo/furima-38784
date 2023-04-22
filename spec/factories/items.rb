FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/empty-room-with-chairs-and-desks.jpg'), filename: 'empty-room-with-chairs-and-desks.jpg')
    end
title {'商品名'}
goods_detail {'これは商品'} 
category_id {'2'}
quality_id {'2'}
postage_id {'2'}
delivery_id {'2'}
prefectures_id {'2'}
price {'300'}
association :user 


end
end
