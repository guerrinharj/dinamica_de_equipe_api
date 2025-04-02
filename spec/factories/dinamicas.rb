FactoryBot.define do
  factory :dinamica do
    nome { "Dinâmica Exemplo" }
    descricao { "Descrição da dinâmica exemplo." }
    participantes { ["Ana", "Bruno"] }
  end
end
