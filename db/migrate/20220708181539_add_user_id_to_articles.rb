class AddUserIdToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :user_id, :int # (TABLE_TARGET, NEW_COLUMN_NAME, DATABASE_TYPE)
  end
end
