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
  has_many :topics

  validates :first_name, :last_name, :username, :email, :language_level, presence: true
  validates :username, :email, uniqueness: true
  validates :email, format: { with: /\A[a-z0-9.]+@[a-z]+\.[a-z]{2,3}\z/i }

  def in_debate?
    debates.active.any?
  end

  def wins
    participants.where(result: "winner").count
  end

  def losses
    participants.where(result: "loser").count
  end

  def user_rank
    rank = ""
    if wins + losses > 0
      ratio = (wins / wins + losses).round * 100
    end
    if (0..19).include?(ratio)
      rank = "Bronze"
    elsif (20..39).include?(ratio)
      rank = "Silver"
    elsif (40..59).include?(ratio)
      rank = "Gold"
    elsif (60..79).include?(ratio)
      rank = "Diamond"
    elsif (80..89).include?(ratio)
      rank = "Platinum"
    elsif (90..96).include?(ratio)
      rank = "Master"
    elsif (97..100).include?(ratio)
      rank = "Grand Master"
    end
    return rank
  end
end
