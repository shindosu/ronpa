class CreateUses < ActiveRecord::Migration[5.2]
  def change
    create_table :uses do |t|
      t.references :debate, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :success, default: true
      t.string :content
      t.integer :side

      t.timestamps
    end
  end
end
