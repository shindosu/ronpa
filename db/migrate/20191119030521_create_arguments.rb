class CreateArguments < ActiveRecord::Migration[5.2]
  def change
    create_table :arguments do |t|
      t.references :topic, foreign_key: true
      t.references :user, foreign_key: true
      t.string :content
      t.integer :side

      t.timestamps
    end
  end
end
