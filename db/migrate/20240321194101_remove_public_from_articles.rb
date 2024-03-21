class RemovePublicFromArticles < ActiveRecord::Migration[7.1]
  def change
    remove_column :articles, :public, :string
  end
end
