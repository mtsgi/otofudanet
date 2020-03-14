class Icon < ApplicationRecord
    has_one :user, class_name: 'User', foreign_key: 'icon_id'
end
