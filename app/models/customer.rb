# app/models/customer.rb

class Customer < ApplicationRecord
  has_secure_password
  has_many :bookings, dependent: :destroy
  has_many :buses, through: :bookings

  belongs_to :admin
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  def generate_jwt
    payload = { user_id: id }
    Jsonwebtoken.encode(payload)
  end
end
