class RemoveCreatedAtFromDeals < ActiveRecord::Migration[7.1]
  def change
    remove_column :deals, :CreatedAt, :datetime
  end
end
