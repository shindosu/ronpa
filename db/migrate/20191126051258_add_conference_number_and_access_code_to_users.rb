class AddConferenceNumberAndAccessCodeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :conference_number, :integer
    add_column :users, :access_code, :integer
  end
end
