class User < ApplicationRecord
    has_secure_password
    generate_public_uid generator: PublicUid::Generators::HexStringSecureRandom.new(4)
end
