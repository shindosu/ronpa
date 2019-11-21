class CreateDebates < ActiveRecord::Migration[5.2]
  def change
    create_table :debates do |t|
      t.references :topic, foreign_key: true
      t.integer :phase, default: 0

      t.timestamps
    end
  end
end
