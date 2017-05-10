class Brand < ApplicationRecord
  mount_uploader :brandlogo, BrandLogoUploader
  has_many :sneakers
end
