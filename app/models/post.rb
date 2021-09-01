class Post < ApplicationRecord
  belongs_to :user
  has_many :fix_orders
  has_one_attached :photo
end
