# frozen_string_literal: true

# Users can send employee recognition awards
class User < ApplicationRecord
  acts_as_authentic

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
