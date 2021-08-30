class CleaningStation < ApplicationRecord
  has_many :fix_orders
  has_many :posts, through: :fix_orders
end
