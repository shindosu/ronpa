class AddDescriptionAndCategoryToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :description, :text
    add_column :topics, :category, :string
  end
end
