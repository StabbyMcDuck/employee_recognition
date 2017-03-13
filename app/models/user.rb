# frozen_string_literal: true

# Users can send employee recognition awards
class User < ApplicationRecord
  has_many :granted_awards,
           class_name: "Award",
           foreign_key: :granter_id

  has_many :received_awards,
           class_name: "Award",
           foreign_key: :employee_id

  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::Sha512
  end

def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end

  # Validations
  validates :crypted_password,
            presence: true
  validates :email,
            presence: true
  validates :name,
            presence: true
  validates :password_salt,
            presence: true
  validates :signature,
            presence: {
                if: "role_type == 'non_admin'"
            }

  enum role_type: [:guest, :non_admin, :admin]

end
