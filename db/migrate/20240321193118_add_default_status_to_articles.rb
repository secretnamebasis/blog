class AddDefaultStatusToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :default, :string
    add_column :articles, :public, :string
  end
end
