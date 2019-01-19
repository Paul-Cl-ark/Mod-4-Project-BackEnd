class User < ApplicationRecord
  has_secure_password
  has_many :to_dos
  validates :email, uniqueness: { case_sensitive: false }

end
