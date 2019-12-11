class User < ApplicationRecord
    has_secure_password
    generate_public_uid generator: PublicUid::Generators::HexStringSecureRandom.new(4)

    validates :nfcid, uniqueness: true


    validates :mail, uniqueness: true, allow_nil: true

    has_many :p1, class_name: 'Result', :foreign_key => 'p1_id'
    has_many :p2, class_name: 'Result', :foreign_key => 'p2_id'


end
