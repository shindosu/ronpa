class AddConferenceNumberAndAccessCodeToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :conference_number, :integer
    add_column :topics, :access_code, :integer
  end
end
