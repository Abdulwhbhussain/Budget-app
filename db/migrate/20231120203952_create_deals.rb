class CreateDeals < ActiveRecord::Migration[7.1]
  def change
    create_table :deals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :amount
      t.datetime :CreatedAt

      t.timestamps
    end
  end
end
