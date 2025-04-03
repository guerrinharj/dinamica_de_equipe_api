class Log < ApplicationRecord
    belongs_to :dinamica

    validates :action, presence: true
end