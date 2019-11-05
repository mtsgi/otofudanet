class User < ApplicationRecord
    has_secure_password
    generate_public_uid generator: PublicUid::Generators::HexStringSecureRandom.new(4)

    validates :nfcid, uniqueness: true
    validates :mail, uniqueness: true
end
