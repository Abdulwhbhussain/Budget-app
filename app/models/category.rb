class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_and_belongs_to_many :deals, dependent: :destroy, join_table: 'deals_categories', foreign_key: 'category_id', association_foreign_key: 'deal_id', uniq: true

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: true
  validates :icon, presence: true
end
