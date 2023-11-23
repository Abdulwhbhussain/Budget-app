class CreateDealsCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :deals_categories do |t|
      t.references :deal, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
