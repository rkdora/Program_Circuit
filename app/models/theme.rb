class Theme < ApplicationRecord
  has_many :codes, dependent: :destroy
  has_many :theme_images, dependent: :destroy

  validates :title, presence: true, uniqueness: true
end
