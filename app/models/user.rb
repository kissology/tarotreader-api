class User < ApplicationRecord
  belongs_to :role
  has_many :readings, foreign_key: 'client_id', dependent: :destroy
  has_secure_password  # for password_digest column
end
