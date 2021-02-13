FactoryBot.define do
  factory :user_order do
    user_id       { 1 }
    item_id       { 1 }
    post_code     { '123-4567'}
    prefecture_id { 2 }
    city          { '渋谷区' }
    address       { '道玄坂' }
    phone_number  { '09012345678' }
    token         {"tok_abcdefghijk00000000000000000"}
  end
end
