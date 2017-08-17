class AddPageLineToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :line, :text
  end
end