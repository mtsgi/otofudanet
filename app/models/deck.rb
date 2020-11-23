require "validator/slot_num_validator"

class Deck < ApplicationRecord
    belongs_to :user
    enum status:{ sub: 0, main: 1 }

    validates :name, length: { maximum: 20 }
    validates :slot1, :slot2, :slot3, :slot4, :slot5,
        numericality: { only_integer: true, greater_than: 0, less_than: 13, allow_blank: true }
    validates :slot1, slot_num: true
end
