class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :proposition
      t.string :level

      t.timestamps
    end
  end
end
