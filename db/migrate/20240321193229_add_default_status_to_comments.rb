class AddDefaultStatusToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :default, :string
    add_column :comments, :public, :string
  end
end
