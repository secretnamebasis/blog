class RemoveDefaultFromComments < ActiveRecord::Migration[7.1]
  def change
    remove_column :comments, :default, :string
  end
end
