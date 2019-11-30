class CreateArticles < ActiveRecord::Migration[6.0]
  # rails g migration create_articles #done with underscore
  # rails db:mirgate
  # rails db:rollback
  # t === table, here is where you DEFINE attributes
  def change
    create_table :articles do |t|
      t.string :title
    end
  end
end
