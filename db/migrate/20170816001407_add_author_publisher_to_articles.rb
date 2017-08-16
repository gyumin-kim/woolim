class AddAuthorPublisherToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :author, :text
    add_column :articles, :publisher, :text
  end
end
