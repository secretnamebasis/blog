class RemoveDefaultFromArticles < ActiveRecord::Migration[7.1]
  def change
    remove_column :articles, :default, :string
  end
end
