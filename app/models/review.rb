class Review < ApplicationRecord
  belongs_to :dinamica

  validates :comentario, presence: true
  validates :nota, presence: true, inclusion: { in: 1..5 }
end