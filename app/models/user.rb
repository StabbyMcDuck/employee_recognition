# frozen_string_literal: true

# Users can send employee recognition awards
class User < ApplicationRecord
  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::Sha512

  # Validations
  validates :crypted_password,
            presence: true
  validates :email,
            presence: true
  validates :name,
            presence: true
  validates :password_salt,
            presence: true
  end

  enum role_type: [:guest, :non_admin, :admin]

end
