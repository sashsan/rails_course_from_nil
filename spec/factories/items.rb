FactoryBot.define do
  factory :item do
    price  { 50 }
    name   { 'car' }
    real   { true }
    weight { 20 }
    description { 'black' }
  end
end