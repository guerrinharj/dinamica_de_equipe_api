FactoryBot.define do
  factory :review do
    association :dinamica
    comentario { "Comentário interessante" }
    nota { rand(1..5) }
    created_at { Time.now }
  end
end
