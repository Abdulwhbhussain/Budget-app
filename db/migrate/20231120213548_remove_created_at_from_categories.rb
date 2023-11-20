class RemoveCreatedAtFromCategories < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :CreatedAt, :datetime
  end
end
