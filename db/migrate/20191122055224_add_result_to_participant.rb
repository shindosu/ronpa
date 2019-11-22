class AddResultToParticipant < ActiveRecord::Migration[5.2]
  def change
    add_column :participants, :result, :integer, default: 0
  end
end
