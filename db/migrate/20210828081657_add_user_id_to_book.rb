class AddUserIdToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :user_id, :text
  end
end
