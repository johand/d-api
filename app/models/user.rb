# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: self

  has_many :movies, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :characters, dependent: :destroy

  validates :username,
            presence: { message: 'Required' },
            uniqueness: { message: 'Has already been taken' },
            length: { minimum: 5,
                      maximum: 20,
                      message: 'Minimum 5 and maximum 20 characters' }

  validates :password, confirmation: true
  validates :password_confirmation, presence: true, on: :create
  validates :email, uniqueness: true,
                    format: { with: /\A([\w.%+\-]+)@([\w\-]+\.)+(\w{2,})\z/i }
end
