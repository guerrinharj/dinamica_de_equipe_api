FactoryBot.define do
  factory :log do
    action { "MyString" }
    dinamica_id { 1 }
    data_anterior { "" }
    data_nova { "" }
  end
end
