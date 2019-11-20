class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  LANGUAGE_LEVELS = ['Native', 'Advanced', 'Intermediate', 'Basic', 'Beginner']
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo, PhotoUploader

  has_many :arguments
  has_many :uses
  has_many :participants
  has_many :debates, through: :participants

  validates :first_name, :last_name, :username, :email, :language_level, presence: true
  validates :username, :email, uniqueness: true
  validates :email, format: { with: /\A[a-z0-9.]+@[a-z]+\.[a-z]{2,3}\z/i }

  def in_debate?
    debates.active.any?
  end
end
