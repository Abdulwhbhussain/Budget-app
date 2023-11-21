class ChangeUserIdToAuthorIdInCategories < ActiveRecord::Migration[7.1]
  def change
    rename_column :categories, :user_id, :author_id
  end
end
