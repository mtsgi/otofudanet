class Result < ApplicationRecord
  belongs_to :p1, class_name: "User", :foreign_key => "p1_id"
  belongs_to :p2, class_name: "User", :foreign_key => "p2_id"

  enum p1_difficulty: { easy: 0, normal: 1, hard: 2 }, _prefix: true
  enum p2_difficulty: { easy: 0, normal: 1, hard: 2 }, _prefix: true
end
