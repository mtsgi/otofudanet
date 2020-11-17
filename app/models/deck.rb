class Deck < ApplicationRecord
    belongs_to :user
    enum status:{ sub: 0, main: 1 }

    validates :name, length: { maximum: 20 }
end
