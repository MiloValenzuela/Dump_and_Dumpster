class CleaningStation < ApplicationRecord
  has_many :fix_orders
  has_many :posts, through: :fix_orders
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
