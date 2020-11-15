FactoryBot.define do
  factory :purchase_address do
    token {"tok_abcdefghijk12345678901234567"}
    postal {"111-1111"}
    prefecture_id {2}
    municipality {"北海道市"}
    street {"ほっかいどう1-1"}
    building {"アパート101"}
    phone {"09011112222"}
  end
end
