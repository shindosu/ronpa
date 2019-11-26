class AddReviewToParticipants < ActiveRecord::Migration[5.2]
  def change
    add_column :participants, :communication, :integer, default: 0
    add_column :participants, :persuasiveness, :integer, default: 0
    add_column :participants, :civility, :integer, default: 0
  end
end
