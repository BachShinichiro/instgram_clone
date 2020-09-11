class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :content, :text
    add_column :users, :image, :text
  end
end
