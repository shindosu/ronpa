class Debate < ApplicationRecord
  belongs_to :topic
  has_many :uses
  has_many :participants
end
