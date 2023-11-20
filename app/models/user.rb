class User < ApplicationRecord
  has_many :deals
  has_many :categories
end
