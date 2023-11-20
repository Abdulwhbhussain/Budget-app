class ChangeUserIdToAuthorIdInDeals < ActiveRecord::Migration[7.1]
  def change
    rename_column :deals, :user_id, :author_id
  end
end
