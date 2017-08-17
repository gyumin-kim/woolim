class AddBookPageToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :book_page, :integer
  end
end
