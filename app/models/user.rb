class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :arguments
  has_many :uses
  has_many :participants

  validates :first_name, :last_name, :username, :email, :language_level, presence: true
  validates :username, :email, uniqueness: true
  validates :email, format: { with: /\A[a-z0-9.]+@[a-z]+\.[a-z]{2,3}\z/i }
end
