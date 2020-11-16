class Deck < ApplicationRecord
    enum status:{ sub: 0, main: 1 }
end
