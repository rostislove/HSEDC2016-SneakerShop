class Sneaker < ApplicationRecord
  belongs_to :brand
  mount_uploader :sneakerimage, SneakerImageUploader
  validates :brand_id, :sneakerimage, presence: true
end
