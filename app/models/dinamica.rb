class Dinamica < ApplicationRecord
    has_many :logs, dependent: :destroy
    has_many :reviews, dependent: :destroy

    validates :nome, presence: true
    validates :descricao, presence: true

    def avaliacao_media
        return nil if reviews.empty?

        reviews.average(:nota).round(2)
    end
end