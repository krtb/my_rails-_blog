class AddDescriptionToArticles < ActiveRecord::Migration[6.0]
  #change method is how we're going to update the table
  # use add_column
  # 1) give the table name = articles
  # 2) give attributes = description
  # 3) type for attr name = text

  #TIMESTAMPS
  #  - normally added to tables by using t.timestamps
  def change
    add_column :articles, :description, :text 
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
