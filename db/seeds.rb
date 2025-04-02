tempestade_de_ideias = Dinamica.create!(
    nome: "Tempestade de Ideias",
    descricao: "Uma dinâmica para gerar ideias rapidamente em grupo."
)

construcao_em_equipe = Dinamica.create!(
    nome: "Construção em Equipe",
    descricao: "Atividade que incentiva a colaboração para construir algo juntos."
)

quebra_gelo = Dinamica.create!(
    nome: "Quebra-Gelo",
    descricao: "Dinâmica leve para introdução entre participantes."
)

Review.create!(
    dinamica: tempestade_de_ideias,
    comentario: "Muito divertida e produtiva!",
    nota: 5,
    created_at: Time.now
)

Review.create!(
    dinamica: tempestade_de_ideias,
    comentario: "Ajudou bastante na geração de ideias.",
    nota: 4,
    created_at: Time.now
)

Review.create!(
    dinamica: construcao_em_equipe,
    comentario: "Boa para integrar o time.",
    nota: 5,
    created_at: Time.now
)
