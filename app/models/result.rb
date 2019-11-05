class Result < ApplicationRecord
  belongs_to :p1, class_name: "User", :foreign_key => "p1_id"
  belongs_to :p2, class_name: "User", :foreign_key => "p2_id"
end
