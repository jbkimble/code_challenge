class StreetCafe < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :chairs_num, presence: true

end
