class Post < ApplicationRecord
  belongs_to :user
  has_many :fix_orders, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo

  after_create :assign_fix_order

  private

  def assign_fix_order
    cleaning_station = CleaningStation.near([self.latitude, self.longitude], 20).first
    FixOrder.create(post: self, cleaning_station: cleaning_station) if cleaning_station
  end

  # adding country to the regular address so we can be more specific later for geocode
  # def custom_address
  #   "#{address}, #{country}"
  # end
end
