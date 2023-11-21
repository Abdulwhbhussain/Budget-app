class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories, dependent: :destroy, join_table: 'deals_categories', foreign_key: 'deal_id',
                                       association_foreign_key: 'category_id', uniq: true

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
